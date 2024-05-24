import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lmsapp/customwidgets/customroute.dart';
import 'package:lmsapp/models/course_details_model.dart';
import 'package:lmsapp/models/homemodel.dart';
import 'package:lmsapp/models/profile_model.dart';
import 'package:lmsapp/utilities/appcolors.dart';
import 'package:lmsapp/utilities/appimages.dart';
import 'package:lmsapp/views/menu_screens/cart/cartscreen.dart';
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

  bool loadinggetprofile = false;
  bool loadingcoursedetails = false;
  HomeModel? _homeModel;
  HomeModel? get home => _homeModel;
  CourseDetailModel? _courseDetailModel;
  CourseDetailModel? get course => _courseDetailModel;
  ProfileModel? _profileModel;
  ProfileModel? get profile => _profileModel;

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

  bool addwishlistpopular = false;
  bool addwishlistfeatured = false;

  addToWishlistPopular() {
    addwishlistpopular = !addwishlistpopular;
    notifyListeners();
  }

  addToWishlistfeatured() {
    addwishlistfeatured = !addwishlistfeatured;
    notifyListeners();
  }

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
            CustomPageRoute(child: const ProfileScreen()), (route) => false);
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
      notifyListeners();
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

  late PageController pageController;
  void startAutoPageChange() {
    Timer.periodic(const Duration(seconds: 0), (Timer timer) {
      if (currentslide < onboardimgs.length - 1) {
        currentslide++;
      } else {
        currentslide = 0;
      }
      if (pageController.hasClients) {
        pageController.animateToPage(
          currentslide,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
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
    const CartScreen(),
    const FeatureScreen(),
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

  getaddwishlist(id) async {
    var tokken = await Utils.getToken();
    try {
      loadingaddwishlist = true;
      notifyListeners();
      await fetchaddwishlist(tokken, id).then((course) {
        loadingaddwishlist = false;
        notifyListeners();
        print('course $course');
      });
    } catch (e) {
      loadingaddwishlist = false;
      notifyListeners();
      rethrow;
    }
  }
}
