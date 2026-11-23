import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:newf/core/extension/context.dart';
import 'package:newf/core/extension/double.dart';
import 'package:newf/core/shared/methods/location_Service.dart';
import 'package:newf/core/shared/widgets/app_bar.dart';
import 'package:newf/core/theming/app_colors.dart';
import 'package:newf/core/theming/app_text_styles.dart';
import 'package:newf/core/theming/app_values.dart';

class LocationPickResult {
  final double latitude;
  final double longitude;
  final String? address;

  const LocationPickResult({
    required this.latitude,
    required this.longitude,
    this.address,
  });
}

/// A full screen or modal to pick a location on OpenStreetMap by dragging the map.
class OpenMapLocationPickerScreen extends StatefulWidget {
  const OpenMapLocationPickerScreen({
    super.key,
    this.initialLatitude,
    this.initialLongitude,
  });

  final double? initialLatitude;
  final double? initialLongitude;

  @override
  State<OpenMapLocationPickerScreen> createState() =>
      _OpenMapLocationPickerScreenState();
}

class _OpenMapLocationPickerScreenState
    extends State<OpenMapLocationPickerScreen> {
  late final MapController _mapController;
  late LatLng _centerPoint;
  final ValueNotifier<String?> _addressNotifier = ValueNotifier(null);
  final ValueNotifier<bool> _isResolvingAddress = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    final lat = widget.initialLatitude ?? 24.7136; // Default to Riyadh
    final lng = widget.initialLongitude ?? 46.6753;
    _centerPoint = LatLng(lat, lng);
    _resolveAddress(_centerPoint);
  }

  @override
  void dispose() {
    _mapController.dispose();
    _addressNotifier.dispose();
    _isResolvingAddress.dispose();
    super.dispose();
  }

  Future<void> _resolveAddress(LatLng point) async {
    _isResolvingAddress.value = true;
    final address = await LocationService().reverseGeocode(
      point.latitude,
      point.longitude,
    );
    _addressNotifier.value = address;
    _isResolvingAddress.value = false;
  }

  Future<void> _goToCurrentLocation() async {
    final position = await LocationService().getCurrentLocation();
    if (position != null) {
      final newPoint = LatLng(position.latitude, position.longitude);
      _centerPoint = newPoint;
      _mapController.move(newPoint, 16);
      _resolveAddress(newPoint);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'OpenStreetMap Location Picker Screen',
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'pick_location_on_map'.tr(),
        ),
        body: Stack(
          children: [
            // ── OpenStreetMap View ───────────────────────────────────────────
            FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: _centerPoint,
                initialZoom: 15,
                onPositionChanged: (position, hasGesture) {
                  if (hasGesture) {
                    _centerPoint = position.center;
                  }
                },
                onMapEvent: (event) {
                  if (event is MapEventMoveEnd) {
                    _resolveAddress(_centerPoint);
                  }
                },
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.pissarde.app',
                ),
              ],
            ),

            // ── Center Pin Marker ─────────────────────────────────────────────
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: AppSizes.s32),
                child: Icon(
                  Icons.location_on,
                  size: AppSizes.s48,
                  color: context.theme.primaryColor,
                ),
              ),
            ),

            // ── Current Location FAB ─────────────────────────────────────────
            Positioned(
              right: AppPadding.p16,
              bottom: AppSizes.s180,
              child: FloatingActionButton.small(
                heroTag: 'map_current_loc_fab',
                backgroundColor: context.theme.scaffoldBackgroundColor,
                onPressed: _goToCurrentLocation,
                child: Icon(
                  Icons.my_location,
                  color: context.theme.primaryColor,
                ),
              ),
            ),

            // ── Bottom Card with Info & Confirmation ──────────────────────────
            Positioned(
              left: AppPadding.p16,
              right: AppPadding.p16,
              bottom: AppPadding.p24,
              child: Container(
                padding: const EdgeInsets.all(AppPadding.p16),
                decoration: BoxDecoration(
                  color: context.theme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(AppSizes.r16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.place_outlined,
                          color: context.theme.primaryColor,
                          size: AppSizes.s20,
                        ),
                        AppSizes.s8.horizontalSpace,
                        Expanded(
                          child: ValueListenableBuilder<bool>(
                            valueListenable: _isResolvingAddress,
                            builder: (context, isResolving, _) {
                              if (isResolving) {
                                return Row(
                                  children: [
                                    const SizedBox(
                                      width: AppSizes.s14,
                                      height: AppSizes.s14,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    ),
                                    AppSizes.s8.horizontalSpace,
                                    Text(
                                      'loading'.tr(),
                                      style: AppTextStyles.font12Regular,
                                    ),
                                  ],
                                );
                              }
                              return ValueListenableBuilder<String?>(
                                valueListenable: _addressNotifier,
                                builder: (context, address, _) {
                                  return Text(
                                    address ?? 'drag_map_to_pick_location'.tr(),
                                    style: AppTextStyles.font13Medium,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    AppSizes.s8.verticalSpace,
                    Text(
                      '${_centerPoint.latitude.toStringAsFixed(6)}, ${_centerPoint.longitude.toStringAsFixed(6)}',
                      style: AppTextStyles.font11Regular.copyWith(
                        color: AppColors.contractorGreyText,
                      ),
                    ),
                    AppSizes.s16.verticalSpace,
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(
                          LocationPickResult(
                            latitude: _centerPoint.latitude,
                            longitude: _centerPoint.longitude,
                            address: _addressNotifier.value,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.theme.primaryColor,
                        padding: const EdgeInsets.symmetric(
                          vertical: AppPadding.p12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSizes.r10),
                        ),
                      ),
                      child: Text(
                        'confirm_location'.tr(),
                        style: AppTextStyles.font14Bold.copyWith(
                          color: context.theme.scaffoldBackgroundColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
