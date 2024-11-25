import '../helper/app_export.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({
    Key? key,
    required this.isSliverAppBarExpanded,
    required this.appBarTitle,
    this.isMoreCustom = false,
    this.isShowDescription = false,
    this.description = "",
    this.name = "",
    this.message = "",
    this.imageUrl = "",
    this.inquiryDetail = "",
  }) : super(key: key);

  final bool isSliverAppBarExpanded;
  final String appBarTitle;
  final bool isMoreCustom;
  final bool isShowDescription;
  final String description;
  final String name;
  final String message;
  final String imageUrl;
  final String inquiryDetail;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // toolbarHeight: 40,
      centerTitle: false,
      title: AnimatedOpacity(
        opacity: isSliverAppBarExpanded ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 100),
        child: Text(
          appBarTitle,
          style: AppStyle.txtRobotoRomanExtraBold24(context),
        ),
      ),
      titleSpacing: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: isMoreCustom
            ? Container(
                padding: UIhelper.paddingHelper(context,
                    top: 0, bottom: 20, right: 20, left: 20),
                decoration: BoxDecoration(
                  color: ColorConstant.blueGray,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(getSize(context, 22)),
                    bottomRight: Radius.circular(getSize(context, 22)),
                  ),
                  gradient: LinearGradient(
                      begin: const Alignment(0, .7),
                      end: const Alignment(0, 1),
                      stops: const [
                        .5,
                        1.0
                      ],
                      colors: [
                        ColorConstant.blueGray,
                        ColorConstant.gray300,
                      ]),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appBarTitle,
                      style: AppStyle.txtRobotoRomanExtraBold24(context),
                    ),
                    SizedBox(
                      height: getVerticalSize(context, 15),
                    ),
                    !isShowDescription
                        ? Container(
                            padding: UIhelper.paddingHelper(context,
                                top: 8, bottom: 8, right: 10, left: 10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(getSize(context, 8)),
                              color: ColorConstant.lime700,
                            ),
                            // ignore: prefer_const_constructors
                            child: UserInfoWidget(
                              imageUrl: imageUrl,
                              name: name,
                              message: message,
                              inquiryDetail: inquiryDetail,
                            ),
                          )
                        : SizedBox(
                            child: Text(
                              'Please enter your current password, new password and confirm new password.',
                              style: AppStyle.txtRobotoRomanRegular16(context),
                            ),
                          ),
                  ],
                ),
              )
            : Padding(
                padding: UIhelper.paddingHelper(context,
                    top: 0, bottom: 0, right: 0, left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appBarTitle,
                      style: AppStyle.txtRobotoRomanExtraBold24(context),
                    ),
                  ],
                ),
              ),
      ),
      expandedHeight: isMoreCustom ? 190 : 70,
      pinned: true,
      backgroundColor: ColorConstant.whiteA700,
      elevation: 3,
      leading: IconButton(
          icon: const Icon(Icons.arrow_back), onPressed: () => Get.back()),
      iconTheme: IconThemeData(color: ColorConstant.black900),
    );
  }
}
