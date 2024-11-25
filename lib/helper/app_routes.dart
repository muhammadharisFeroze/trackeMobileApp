import 'app_export.dart';

HomeController homeController = HomeController();

class AppRoute {
  static String initial = '/';
  static String testingbalesdata = '/homepage';
  static String login = '/login';
  static String forgotPassword = '/forgotPassword';
  static String verifyEmail = '/verifyEmail';
  static String home = '/home';
  static String orderStatus = '/OrderStatus';
  static String weaving = '/weaving';
  static String dyeing = '/dyeing';
  static String stitching = '/stitching';
  static String lotReports = '/lotReports';
  static String inquiryDetails = '/inquiryDetails';
  static String orderDetails = '/orderDetails';
  static String poDetails = '/poDetails';
  static String changePassword = '/changePassword';
  static String shippingDetails = '/shippingDetails';
  static String resetPassword = '/resetPassword';
  static String qrScanner = '/qrScanner';
  static String weavingIssuedAndReceived = '/weavingIssueAndRecieved';
  static String dyeIssuedAndReceived = '/dyeingIssueAndRecieved';
  static String tree = '/tree';
  static String spinning = '/spinning';
  static String balesCombination = '/balescombination';

  static List<GetPage<dynamic>>? getPages = [
    GetPage(
      name: initial,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: forgotPassword,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: verifyEmail,
      page: () => VerifyEmailView(),
      binding: VerifyEmailBinding(),
    ),
    GetPage(
      name: home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: orderStatus,
      page: () => const OrderStatusView(),
      binding: OrderStatusBindings(),
    ),
    GetPage(
      name: weaving,
      page: () => const WeavingView(),
      binding: WeavingBindings(),
    ),
    GetPage(
      name: dyeing,
      page: () => const DyeingView(),
      binding: DyeingBinding(),
    ),
    GetPage(
      name: stitching,
      page: () => const StitchingView(),
      binding: StitchingBinding(),
    ),
    GetPage(
      name: lotReports,
      page: () => LotReportsView(),
      binding: LotReportsBinding(),
    ),
    GetPage(
      name: inquiryDetails,
      page: () => const InquiryDetailsView(),
      binding: InquiryDetailsBindings(),
    ),
    GetPage(
      name: orderDetails,
      page: () => const OrderDetailsView(),
      binding: OrderDetailsBindings(),
    ),
    GetPage(
      name: poDetails,
      page: () => const PoDetailsView(),
      binding: PoDetailsBinding(),
    ),
    GetPage(
      name: changePassword,
      page: () => ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: shippingDetails,
      page: () => const ShippingDetailsView(),
      binding: ShippingDetailsBinding(),
    ),
    GetPage(
      name: resetPassword,
      page: () => ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: qrScanner,
      page: () => QRScannerView(),
      binding: QRScannerBindings(),
    ),
    GetPage(
      name: weavingIssuedAndReceived,
      page: () => const WeavingIssueAndRecievedView(),
      binding: WeavingIssueAndRecievedBindings(),
    ),
    GetPage(
      name: dyeIssuedAndReceived,
      page: () => const DyeingIssueAndRecievedView(),
      binding: DyeingIssueAndRecievedBindings(),
    ),
    GetPage(
      name: tree,
      page: () => const TreeView(),
      binding: TreeBinding(),
    ),
    GetPage(
      binding: SpinningBindings(),
      name: spinning,
      page: () => SpinningView(),
    ),
    GetPage(
        name: balesCombination,
        page: () => const BalesCombinationView(),
        binding: BalesBindings()),
    // GetPage(name: testingbalesdata, page: () => BalesScreen()),
  ];
}
