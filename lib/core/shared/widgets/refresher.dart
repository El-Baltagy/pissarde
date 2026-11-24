import 'package:flutter/Material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../extension/context.dart';


class CustomRefresher extends StatefulWidget {
  const CustomRefresher({super.key, required this.refreshController, required this.enablePullDown, required this.enablePullUp, required this.child, this.onLoadFun, this.onLoadRefresh});
  final RefreshController refreshController;
  final bool enablePullDown,enablePullUp;
  final Widget child;
  final Future<void> Function()? onLoadFun,onLoadRefresh;
  @override
  State<CustomRefresher> createState() => _CustomRefresherState();
}

class _CustomRefresherState extends State<CustomRefresher> {
  bool isLoadingPag=false;
  bool isRefreshPag=false;
  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        controller: widget.refreshController,
        enablePullDown:  widget.enablePullDown,
        enablePullUp: widget.enablePullUp,
        header: HeaderRefersh(
          isLoading: isRefreshPag,
        ),
        footer: CustomFooter(
          loadStyle:
          isLoadingPag  ? LoadStyle.ShowAlways : LoadStyle.HideAlways,
          height: 40,
          builder: (BuildContext context, LoadStatus? m) {
            if (m == LoadStatus.loading) {
              return Center(
                child: CircularProgressIndicator(
                  color: context.theme.primaryColor,
                  backgroundColor: Colors.transparent,
                ),
              );
            }
            return SizedBox.shrink();
          },
        ),
        onRefresh: () async{
          if (isRefreshPag) return;
          isRefreshPag = true;
          setState(() {});
          // await   Future.delayed(Duration(seconds: 4));
          await widget.onLoadRefresh?.call()
              .whenComplete(() {
            widget.refreshController.refreshCompleted();
            isRefreshPag = false;
            setState(() {});
          });
        },
        onLoading: () async {
          if (isLoadingPag) return;
          isLoadingPag = true;
          setState(() {});
          // await   Future.delayed(Duration(seconds: 4));
          await widget.onLoadFun?.call()
              .whenComplete(() {
            widget.refreshController.loadComplete();
            isLoadingPag = false;
            setState(() {});
          });
        },
        child:  widget.child
    );
  }
}
class HeaderRefersh extends StatelessWidget {
  const HeaderRefersh({
    super.key,
    this.isLoading = false,
  });


  /// Pass [true] while a load-more is in progress to hide the pull-down
  /// indicator completely. Pass [false] (default) to show it normally.
  final bool isLoading;

  @override
  Widget build(BuildContext context) {

    return MaterialClassicHeader(
      // backgroundColor: isLoading?Colors.transparent:AppColors.white,
      // color: isLoading?AppColors.primary:Colors.transparent,
      // height: isLoading?0:80 ,
      // distance: isLoading?0:50 ,

    );

  }
}