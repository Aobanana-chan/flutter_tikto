import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tiktok/page/widget/shoot_bottom_widget.dart';
import 'package:flutter_tiktok/page/widget/shoot_right_widget.dart';
import 'package:flutter_tiktok/page/widget/shoot_top_widget.dart';

///拍摄页
class ShootPage extends StatefulWidget {
  const ShootPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ShootPageState();
  }
}

class _ShootPageState extends State<ShootPage> {
  CameraController _cameraController;
  List<CameraDescription> _cameras;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((bottomBarLayout) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ));
    });

    _initCamera();
  }

  Future<void> _initCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(_cameras[0], ResolutionPreset.max);
    _cameraController.initialize().then((value) {
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (null == _cameraController || !_cameraController.value.isInitialized) {
      return const Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(
            backgroundColor: Colors.red,
          ),
        ),
      );
    }

    return Scaffold(
      body: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          minWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height,
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            _getCameraPreview(),
            const ShootTopWidget(),
            const ShootRightWidget(),
            const Positioned(bottom: 0, child: ShootBottomWidget()),
          ],
        ),
      ),
    );
  }

  //获取相机的预览
  _getCameraPreview() {
    double height = MediaQuery.of(context).size.height;
    double cameraHeight = _cameraController.value.previewSize.height;
    double scale = height / cameraHeight;
    return Transform.scale(
      scale: scale,
      alignment: Alignment.topCenter,
      child: CameraPreview(_cameraController),
    );
  }
}
