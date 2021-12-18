import 'package:flutter/material.dart';
import 'package:petpal/views/create_post.dart';
import 'package:petpal/views/driver.dart';
import 'package:petpal/views/home.dart';
import 'package:petpal/views/login_signup.dart';
import 'package:petpal/views/others_profile.dart';
import 'package:petpal/views/otp_screen.dart';
import 'package:petpal/views/post_card_view.dart';
import 'package:petpal/views/user_profile.dart';

const String loginSignupPage = "loginSignup";
const String homePage = "homePage";
const String userProfilePage = "userProfile";
const String othersProfilePage = "othersProfile";
const String otpScreenPage = "otpScreen";
const String driverClass = "driver";
const String postCardViewPage = "postCardView";
const String createPostPage = "createPost";

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case loginSignupPage:
      return MaterialPageRoute(builder: (context) => const LoginSignup());
    case homePage:
      return MaterialPageRoute(builder: (context) => const Home());
    case userProfilePage:
      return MaterialPageRoute(builder: (context) => const UserProfile());
    case othersProfilePage:
      return MaterialPageRoute(builder: (context) => const OtherProfile());
    case otpScreenPage:
      return MaterialPageRoute(builder: (context) => const OTPScreen());
    case driverClass:
      return MaterialPageRoute(builder: (context) => const Driver());
    case postCardViewPage:
      return MaterialPageRoute(builder: (context) => const PostCardView());
    case createPostPage:
      return MaterialPageRoute(builder: (context) => const CreatePost());
    default:
      throw ("route error");
  }
}
