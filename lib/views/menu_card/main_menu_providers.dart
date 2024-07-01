import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/models/course_details_model.dart';
import 'package:lmsapp/models/homemodel.dart';
import 'package:lmsapp/models/payment_model.dart';
import 'package:lmsapp/models/profile_model.dart';
import 'package:lmsapp/models/purchase_course_model.dart';
import 'package:lmsapp/models/purchase_playlist_model.dart';
import 'package:lmsapp/models/start_quiz_model.dart';
import 'package:lmsapp/models/upcoming_test_model.dart';
import 'package:lmsapp/models/wishlist_model.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/views/menu_card/main_menu.dart';

import 'package:lmsapp/views/menu_screens/cart/service/cart_services.dart';
import 'package:lmsapp/views/menu_screens/chat/chatscreen.dart';
import 'package:lmsapp/views/menu_screens/home/homescreen.dart';
import 'package:lmsapp/views/menu_screens/profie/feature_screen.dart';
import 'package:lmsapp/views/menu_screens/profie/profile_pages/landingpages/profile_screen.dart';
import 'package:lmsapp/views/menu_screens/service/main_screen_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utilities/utils.dart';

class MenuProviders extends ChangeNotifier {
  int currenttab = 0;
  int currentslide = 0;

  bool loadingprofiledit = false;
  bool loadingaddwishlist = false;
  bool loadinggetwishlist = false;
  bool loadinggetprofile = false;
  bool loadingcoursedetails = false;
  bool loadingmycourses = false;
  bool loadingmyplaylist = false;
  bool loadingpayment = false;
  bool loadingupcomingtest = false;
  bool loadingstartquiz = false;

  HomeModel? _homeModel;
  HomeModel? get home => _homeModel;

  CourseDetailModel? _courseDetailModel;
  CourseDetailModel? get course => _courseDetailModel;

  MyPlayListModel? _playlistItemModel;
  MyPlayListModel? get playlistitem => _playlistItemModel;

  ProfileModel? _profileModel;
  ProfileModel? get profile => _profileModel;

  UpComingTestModel? _upcomingTestModel;
  UpComingTestModel? get upcomingtest => _upcomingTestModel;

  MyCourseModel? _myCourseModel;
  MyCourseModel? get mycourse => _myCourseModel;

  PaymentModel? _paymentModel;
  PaymentModel? get payment => _paymentModel;

  QuizTestModel? _quizTestModel;
  QuizTestModel? get quiztest => _quizTestModel;

  bool loadinghomedata = false;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController dobcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController nationalitycontroller = TextEditingController();
  TextEditingController provincecontroller = TextEditingController();
  TextEditingController postalcodecontroller = TextEditingController();
  TextEditingController countrycontroller = TextEditingController();

  Future<void> loadeditprofileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emailcontroller.text = prefs.getString('email') ?? '';
    namecontroller.text = prefs.getString('name') ?? '';
    phonenumbercontroller.text = prefs.getString('phone') ?? '';
    dobcontroller.text = prefs.getString('dob') ?? '';
    addresscontroller.text = prefs.getString('address') ?? '';
    provincecontroller.text = prefs.getString('state') ?? '';
    countrycontroller.text = prefs.getString('country') ?? '';
    citycontroller.text = prefs.getString('city') ?? '';
    postalcodecontroller.text = prefs.getString('postalcode') ?? '';
    notifyListeners();
  }

  File? selectedimage;

  Future<File?> pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return null; // User cancelled picking an image
    return File(pickedImage.path);
  }

  Future<File?> captureImage() async {
    final capturedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (capturedImage == null) return null; // User cancelled capturing an image
    return File(capturedImage.path);
  }

  void pickImageAndUploadfromGallery(BuildContext context) async {
    // Pick an image from gallery
    final pickedImage = await pickImage();
    if (pickedImage != null) {
      selectedimage = pickedImage;
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } else {}
  }

  void pickimageanduploadfromcamera(BuildContext context) async {
    // Pick an image from gallery
    final pickedImage = await captureImage();
    if (pickedImage != null) {
      selectedimage = pickedImage;
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } else {}
  }

  Future<void> geteditprofile(BuildContext context) async {
    var token = await Utils.getToken();

    if (token == null) {
      return;
    }

    try {
      loadingprofiledit = true;
      notifyListeners();

      final home = await fetcheditprofile(
        token,
        namecontroller.text,
        phonenumbercontroller.text,
        dobcontroller.text,
        postalcodecontroller.text,
        addresscontroller.text,
        citycontroller.text,
        provincecontroller.text,
        countrycontroller.text,
        emailcontroller.text,
        selectedimage, // Pass selected image file here
      );
      if (home['success'] == true) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: AppColors.primarygreen,
              content: Text(home['message'])),
        );
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('name', namecontroller.text);
        await prefs.setString('email', emailcontroller.text);
        await prefs.setString('phone', phonenumbercontroller.text);
        await prefs.setString('postalcode', postalcodecontroller.text);
        await prefs.setString('city', citycontroller.text);
        await prefs.setString('country', countrycontroller.text);
        await prefs.setString('address', addresscontroller.text);
        await prefs.setString('dob', dobcontroller.text);
        await prefs.setString('state', provincecontroller.text);
        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(context,
            CustomPageRoute(child: const MainMenu()), (route) => false);
        loadingprofiledit = false;
        notifyListeners();
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: AppColors.primaryred,
              content: Text(home['message'])),
        );
      }
    } catch (e) {
      loadingprofiledit = false;
      rethrow;
    }
  }

  getHomedata() async {
    var tokken = await Utils.getToken();
    try {
      loadinghomedata = true;
      notifyListeners();
      await fetchHomedata(tokken).then((home) {
        _homeModel = HomeModel.fromJson(home);
        loadinghomedata = false;
        notifyListeners();
      });
    } catch (e) {
      loadinghomedata = false;
      notifyListeners();
      rethrow;
    }
  }

  getUpComingTest() async {
    var tokken = await Utils.getToken();
    try {
      loadingupcomingtest = true;
      notifyListeners();
      await fetchUpcomingtest(tokken).then((home) {
        _upcomingTestModel = UpComingTestModel.fromJson(home);

        loadingupcomingtest = false;

        notifyListeners();
      });
    } catch (e) {
      loadingupcomingtest = false;
      notifyListeners();
      rethrow;
    }
  }

  getMyCourse() async {
    var tokken = await Utils.getToken();
    try {
      loadingmycourses = true;
      notifyListeners();
      await fetchMyPurchaseCourse(tokken).then((home) {
        _myCourseModel = MyCourseModel.fromJson(home);
        loadingmycourses = false;
        notifyListeners();
      });
    } catch (e) {
      loadingmycourses = false;
      notifyListeners();
      rethrow;
    }
  }

  getMyPlaylist(id) async {
    var tokken = await Utils.getToken();
    try {
      loadingmyplaylist = true;
      notifyListeners();
      await fetchCoursePlaylist(tokken, id).then((home) {
        _playlistItemModel = MyPlayListModel.fromJson(home);
        loadingmyplaylist = false;
        notifyListeners();
      });
    } catch (e) {
      loadingmyplaylist = false;
      notifyListeners();
      rethrow;
    }
  }

  getpayment() async {
    var tokken = await Utils.getToken();
    try {
      loadingpayment = true;
      notifyListeners();
      await fetchPayment(tokken).then((home) {
        _paymentModel = PaymentModel.fromJson(home);
        loadingpayment = false;
        notifyListeners();
      });
    } catch (e) {
      loadingpayment = false;
      notifyListeners();
      rethrow;
    }
  }

  getStartQuiz(id) async {
    var tokken = await Utils.getToken();
    try {
      loadingstartquiz = true;
      notifyListeners();
      await fetchStarttest(tokken, id).then((home) {
        _quizTestModel = QuizTestModel.fromJson(home);
        print('sssss$home');

        loadingstartquiz = false;

        notifyListeners();
      });
    } catch (e) {
      loadingstartquiz = false;
      notifyListeners();
      rethrow;
    }
  }

  getMyProfile() async {
    var tokken = await Utils.getToken();

    try {
      loadinggetprofile = true;
      notifyListeners();
      await fetchprofileget(tokken).then((profile) {
        _profileModel = ProfileModel.fromJson(profile);
        loadinggetprofile = false;
        notifyListeners();
      });
    } catch (e) {
      loadinggetprofile = false;
      notifyListeners();
      rethrow;
    }
  }

  DateTime _selectedDate = DateTime.now();
  DateTime get selectdate => _selectedDate;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      _selectedDate = picked;
      dobcontroller.text = '${picked.year}-${picked.month}-${picked.day}';

      notifyListeners();
    }
  }

  // Future<void> storecredentials() async {
  //   Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  // }

  List<Widget> screens = [
    const HomeScreen(),
    const ChatScreen(),
    const FeatureScreen(),
    const ProfileScreen(),
  ];
  List<String> socialimges = [
    AppImages.insta,
    AppImages.facebok,
    AppImages.youtube
  ];

  List<String> onboardimgs = [
    AppImages.onboardone,
    AppImages.onboardtwo,
    AppImages.onboardthree
  ];
  List<String> onboardtitle = [
    'First See Learning',
    'Connect With Everyone',
    'Always Fascinated Learning',
  ];
  List<String> onboardetails = [
    'Forget about a for of paper all knowledge in one learning!',
    'Always keep in touch with your tutor & friend. Let’s get connected!',
    'Anywhere, anytime. The time is at your discretion so study whenever.',
  ];
  int wishlistitems = 0;
  void increasecartitems() {
    wishlistitems++;
    notifyListeners();
  }

  void decreasecartitems() {
    wishlistitems--;
    notifyListeners();
  }

  getCourseDetails(id) async {
    var tokken = await Utils.getToken();
    try {
      loadingcoursedetails = true;
      notifyListeners();
      await fetchcoursedata(tokken, id).then((course) {
        _courseDetailModel = CourseDetailModel.fromJson(course);
        loadingcoursedetails = false;
        notifyListeners();
      });
    } catch (e) {
      loadingcoursedetails = false;
      notifyListeners();
      rethrow;
    }
  }

  bool addwishlistpopular = false;
  bool addwishlistfeatured = false;

  addToWishlistPopular(bool value) async {
    addwishlistpopular = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('addwishlistpopular', value);
    notifyListeners();
  }

  addToWishlistPopularRemove(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('addwishlistfeatured', value);
    addwishlistpopular = false;

    notifyListeners();
  }

  addToWishlistfeatured(bool value) async {
    addwishlistfeatured = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('addwishlistfeatured', value);
    notifyListeners();
  }

  addToWishlistfeaturedremove(bool value) async {
    addwishlistfeatured = false;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('addwishlistfeatured', value);
    notifyListeners();
  }

  WishlistModel? _wishlistModel;
  WishlistModel? get wishlist => _wishlistModel;

  loadwishlistdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    addwishlistpopular = prefs.getBool('addwishlistpopular') ?? false;
    addwishlistfeatured = prefs.getBool('addwishlistfeatured') ?? false;
    notifyListeners();
  }

  getWishlistData() async {
    var tokken = await Utils.getToken();
    try {
      loadinggetwishlist = true;
      notifyListeners();
      await fetchWishlistdata(tokken).then((policy) {
        _wishlistModel = WishlistModel.fromJson(policy);
        wishlistitems = _wishlistModel!.data!.wishlistItems!.length;
        loadinggetwishlist = false;
        notifyListeners();
      });
    } catch (e) {
      loadinggetwishlist = false;
      notifyListeners();
      rethrow;
    }
  }

  getaddwishlist(id, context) async {
    var tokken = await Utils.getToken();
    try {
      loadingaddwishlist = true;
      notifyListeners();
      await fetchaddwishlist(tokken, id).then((course) {
        if (course['success'] == true) {
          addToWishlistPopular(true);
          addToWishlistPopular(true);
          increasecartitems();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(course['message']),
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(course['message']),
          ));
        }
        loadingaddwishlist = false;
        notifyListeners();
      });
    } catch (e) {
      loadingaddwishlist = false;
      notifyListeners();
      rethrow;
    }
  }

  getRemoveWishlist(id, context, int index) async {
    var tokken = await Utils.getToken();
    try {
      loadingaddwishlist = true;
      notifyListeners();
      await fetchremoveaddwishlist(tokken, id).then((course) {
        if (course['success'] == true) {
          addToWishlistPopularRemove(false);
          addToWishlistfeaturedremove(false);
          decreasecartitems();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(course['message']),
          ));
          wishlist?.data?.wishlistItems?.removeAt(index);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(course['message']),
          ));
        }
        loadingaddwishlist = false;
        notifyListeners();
      });
    } catch (e) {
      loadingaddwishlist = false;
      notifyListeners();
      rethrow;
    }
  }
}
