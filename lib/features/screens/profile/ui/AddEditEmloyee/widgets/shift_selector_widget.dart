part of '../AddEditEmloyee_screen.dart';

class ShiftSelectorWidget extends StatefulWidget {
  const ShiftSelectorWidget({
    super.key,
    required this.selectedNotifier,
    this.field,
    this.isRequired = true,
  });

  final ValueNotifier<List<int>> selectedNotifier;
  final (GlobalKey<FormFieldState<dynamic>>, FocusNode?)? field;
  final bool isRequired;

  @override
  State<ShiftSelectorWidget> createState() => _ShiftSelectorWidgetState();
}

class _ShiftSelectorWidgetState extends State<ShiftSelectorWidget> {
  final TextEditingController _controller = TextEditingController();

  void _listener() {
    final state = ProfileCubit.get(context: context).state;
    if (state is! ProfileLoaded) return;
    final shifts = state.getListShiftsState is Success<GetAllShiftsRes>
        ? (state.getListShiftsState as Success<GetAllShiftsRes>).data?.data ?? []
        : <ShiftItem>[];
    final validIndexes = widget.selectedNotifier.value
        .where((e) => e >= 0 && e < shifts.length)
        .toList();
    _controller.text = validIndexes.map((e) => shifts[e].name).join(' , ');
  }

  @override
  void initState() {
    super.initState();
    widget.selectedNotifier.addListener(_listener);
    _listener();
  }

  @override
  void didUpdateWidget(ShiftSelectorWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedNotifier != widget.selectedNotifier) {
      oldWidget.selectedNotifier.removeListener(_listener);
      widget.selectedNotifier.addListener(_listener);
    }
    _listener();
  }

  @override
  void dispose() {
    widget.selectedNotifier.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ProfileCubit, ProfileState, BaseEmit?>(
      selector: (state) =>
          state is ProfileLoaded ? state.getListShiftsState : null,
      builder: (context, shiftState) {
        final isLoading = shiftState is! Success<GetAllShiftsRes>;
        final shifts = shiftState is Success<GetAllShiftsRes>
            ? shiftState.data?.data ?? []
            : <ShiftItem>[];
        return TitleWithInputField(
          'shift'.tr(),
          DropDownSingleSelectData(
            field: widget.field,
            isLabel: false,
            isRequired: widget.isRequired,
            onTap: () => _showBottomSheet(context, shifts),
            controller: _controller,
          ),
        );
      },
    );
  }

  void _showBottomSheet(BuildContext context, List<ShiftItem> shifts) {
    showModalBottomSheet(
      context: context,
      backgroundColor: context.theme.scaffoldBackgroundColor,
      builder: (BuildContext ctx) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: Container(
            padding: MediaQuery.of(ctx).viewInsets,
            color: context.theme.scaffoldBackgroundColor,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 25),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                      child: Row(
                        children: [
                          Text(
                            'choose_from_one'.tr(),
                            style: TextStyle(
                              fontSize: 15,
                              color: context.theme.primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () => context.pop(),
                            child: const Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20, 0, 20, 0),
                              child: Icon(Icons.close),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    ValueListenableBuilder<List<int>>(
                      valueListenable: widget.selectedNotifier,
                      builder: (context, selected, _) {
                        return Column(
                          children: List.generate(shifts.length, (index) {
                            final isSelected = selected.contains(index);
                            return OneItemDropBottomSheetItem(
                              isRadio: true,
                              showOptionBesideRadioSelect: false,
                              style: TextStyle(
                                fontSize: 15,
                                color: isSelected
                                    ? context.theme.primaryColor
                                    : context.theme.colorScheme.onSurface,
                              ),
                              onTap: () {
                                context.pop();
                                widget.selectedNotifier.value = [index];
                              },
                              title: shifts[index].name,
                              isLastItem: index == shifts.length - 1,
                              isSelected: isSelected,
                            );
                          }),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

