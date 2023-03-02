import 'package:alcohol_free/app/modules/example_module/module_view_model.dart';
import 'package:get/get.dart';

// 의존성 주입은 여기서 하시면 됩니다.

/*
사용 예시

시나리오 1. 어떤 button을 tap할 시 그 페이지로 넘어가면서 의존성 주입

onTap: () {
  // Get.to() 는 Getx에서 Navigation할 때 사용하는 함수입니다.

  Get.to(() => const ModulePage(),
      transition: Transition.rightToLeft,
      binding: ModuleBinding());
}),

시나리오 2. routes 설정되어있을 시 routes 설정 단에서 Binding 설정

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _BindingTestPage(),
      getPages: [
        GetPage(name: '/binding', page: () => BindingSamplePage(),
          binding: BindingsBuilder(() {
            Get.put(GetxSimpleController());
          }),
        ),
      ],
    );
  }
}

// getPages에서 routes 미리 설정

SizedBox(
  width: 120,
  height: 50,
  child: ElevatedButton(
    child: Text("바인딩 관리 Get.toNamed"),
    onPressed: () {
      Get.toNamed('/binding');
    },
  ),
),

나중에 toNamed로 Navigate시 Route 설정한대로 Binding 주입 (View객체 코드가 더 깔끔해짐)
 */

class ModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ModuleViewModel());
  }
}