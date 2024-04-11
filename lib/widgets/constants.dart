import 'package:dog_buddy_dog/go_to_park.dart';
import 'package:dog_buddy_dog/search_screen.dart';
import 'package:flutter/material.dart';
import '../comment_Screen.dart';
import '../dog_details_screen.dart';
import '../home_screen.dart';
import '../new_contact.dart';
import '../notification_screen.dart';
import '../park_name_info_screen.dart';
import '../setting_screen.dart';
import '../store_screen.dart';
import '../user_profile_screen.dart';
import '../chat_screen.dart';

/// All Color
const Color white = Color(0xffFFFFFF);
const Color lightYellow = Color(0xffF9C760);
const Color darkGreen = Color(0xff5C6835);
const Color green = Color(0xff8E9F5A);
const Color black = Color(0xff000000);
const Color blue = Color(0xff4267B2);
const Color red = Color(0xffE0412F);
const Color lightGrey = Color(0xffECEBEB);
const Color pink = Color(0xffF03C67);
const Color textfield = Color(0xffECEBEB);
const Color textColor = Color(0xff4B5725);
const Color transparent = Colors.transparent;
const Color lightGreen = Color(0xffA2B272);
const Color bottomColor = Color(0xff7B8A4D);
const Color darkgreen = Color(0xff1EE252);
const Color containerColor = Color(0xffF7F6FB);
const Color settingBoxColor = Color(0xffF3F3F3);
const Color greenSelect = Color(0xff30C90B);
const Color likeColor = Color(0xffFF0000);
const Color textfieldIconColor = Color(0xff6E773A);

/// OnBoarding Screen
const String imgFriend = 'asset/image/onboarding1.png';
const String imgPet = 'asset/image/Group 226.png';
const String imgLife = 'asset/image/Group 227.png';
const String txtSkip = 'Skip';
const String txtFriend = 'Your New Best \nFriend';
const String txtLoremLpsum = 'Lorem Ipsum is simply dummy text of\n the printing and typesetting industry.';
const String btnGetStarted = 'Get Started';
const String txtPet = 'Social for Your\n Pet';
const String txtLife = 'Show Up Your Pet`s\n Life';

/// Social Login
const String imgBackground = 'asset/image/riddhi.png';
const String imgDogBuddy = 'asset/image/buddy.png';
const String txtDogBuddy = 'Dog Buddy';
const String btnCWF = 'Continue With Facebook';
const String btnCWG = 'Continue With Google';
const String btnCreatAC = 'Create An Account';
const String txtLogin = 'Have Dog Buddy account?';
const String txtLI = '  Log in ';
const String txtSign = 'By Signing Up i agree to our terms of services and \n that you have read our privacy  policy';
const String txtMobail = 'Continue with Mobail';
const String txtMobaileOtp = 'Mobail Number OTP';

/// Login Screen
const String txtWelcom = 'Welcome Back!';
const String txtFullName = 'Full name';
const String txtForget = 'Forgot your password?';
const String btnLogin = 'Log in';
const String txtDontSign = 'Don`t have an account?';
const String txtSignIn = '   Sign Up';
const String txtEmail = 'Email';
const String txtPassword = 'Password';

/// Sign Up 1 Screen
const String txtWelcomeDog = 'Welcome to Dog Buddy!';
const String btnNext = 'Next';

/// Sign Up 2 Screen
const String txtMonitoring = 'Monitoring & Wellness';
const String txtConformPassword = 'Conform Password';
const String btnSignUp = 'Sign Up';

/// Profile 1
const String imgPlus = 'asset/image/plus.png';
const String imgWhiteUser = 'asset/image/whiteuser.png';
const String imgRightClick = 'asset/image/ric_right.png';
const String txtUser = 'User';
const String txtUserName = 'User Name';
const String txtPhoto = 'Photo GuideLines';
const String txtMakeSure = 'Make Sure It`s just you';
const String txtFlaseSmile = 'Flase a smile';
const String txtBulrryBed = 'Blurry is Bad';

/// Profile 2
const String txtEmailId = 'Email ID';
const String txtYourEmail = 'What`s is Your email?';
const String txtSHowProfile = 'This will be show on Your Profile.';

/// Profile 3
const String txtGender = 'Gender';
const String txtHowDoIdentify = 'How Do You Identify?';
const String txtWelcomeDogBuddy = 'Everyone`s Welcome on DogBuddy!';
const String txtWomen = 'Women';
const String txtMen = 'Men';
const String txtNonBinary = 'Non-Binary';

/// Profile 4
const String imgLoaction = 'asset/image/ic_location.png';
const String txtLocation = 'Location';
const String txtWhareAreYou = 'where are you';
const String txtLoactionService = 'Your location services need to be turned \non in order for this to work.';
const String txtSetting = 'Setting - > Privacy- > \n Location Services';
const String btnSubmit = 'Submit';

/// Bottom Bar Text
const String txtSocial = 'Social';
const String txtPark = 'Park';
const String txtFriends = 'Friends';
const String txtChat = 'Chat';
const String txtStores = 'Stores';
const String imgSocial = 'asset/image/social.png';
const String imgPark = 'asset/image/park.png';
const String imgChat = 'asset/image/chat.png';
const String imgFriends = 'asset/image/friends.png';
const String imgStores = 'asset/image/stores.png';

/// Social Screen
const String imgYourStory = 'asset/image/your_story.png';
const String imgIndicator = 'asset/image/dotindicator.png';
const String textYourStory = 'Your Story';
List<String> storyList = ['asset/image/wanda.png', 'asset/image/Rectangle 3613.png', 'asset/image/kerry.png', 'asset/image/mortern.png', 'asset/image/copland.png', 'asset/image/wanda.png', 'asset/image/Rectangle 3613.png', 'asset/image/kerry.png', 'asset/image/wanda.png', 'asset/image/Rectangle 3613.png', 'asset/image/kerry.png', 'asset/image/mortern.png', 'asset/image/copland.png', 'asset/image/wanda.png', 'asset/image/Rectangle 3613.png', 'asset/image/kerry.png'];
List<String> name = ['Wanda', 'Susie', 'Kerry', 'Morten', 'Copland', 'Wanda', 'Susie', 'Kerry', 'Wanda', 'Susie', 'Kerry', 'Morten', 'Copland', 'Wanda', 'Susie', 'Kerry'];
const String icAdd = 'asset/image/ic_add.png';
const String icSearch = 'asset/image/ic_search.png';
const String icDog = 'asset/image/ic_dog.png';
const String txtWandaBaker = 'Wanda Baker';
const String txtLoreum = 'Loreum issupe';
const String txt13k = '13 K';
const String txt21k = '2.1 K';
const String txt2K = '2 K';
const String txtLikedBy = '  Liked by Alvin C.Sommer and 2 other';
const String txtDogSolve = '  #dogsolve#dogs#doglover';
const String txtTime = '  5 Hour ago';
const String icWanda = 'asset/image/ic_wanda.png';
const String imgWanda = 'asset/image/img_Wanda.png';
const String icLike = 'asset/image/ic_like.png';
const String icComment = 'asset/image/ic_comment.png';
const String icShare = 'asset/image/ic_share.png';
const String icSave = 'asset/image/ic_save.png';
List<String> itemList = ['asset/image/img_Wanda.png', 'asset/image/img_blackdog.png', 'asset/image/img_Wanda.png', 'asset/image/img_blackdog.png', 'asset/image/img_Wanda.png', 'asset/image/img_blackdog.png'];

/// Search Screen
const String txtTop = 'Top';
const String txtSerchPet = 'Pet';
const String txtTag = 'Tag';
const String txtSamm = 'Samm';
List<DogTop> topList = [
  DogTop(name: txtSamm, image: 'asset/image/5dog.png', name2: 'Dog',adopt: true),
  DogTop(name: 'Sammy', image: 'asset/image/2chat.png', name2: 'Pat Owner',adopt: true),
  DogTop(name: 'Sammuel Jackson', image: 'asset/image/3chat.png', name2: 'Pat Owner',adopt: true),
  DogTop(name: 'Sam', image: 'asset/image/1chat.png', name2: 'Dog'),
  DogTop(name: 'Sammy', image: 'asset/image/6chat.png', name2: 'Pat Owner'),
  DogTop(name: 'Sammuel Jackson', image: 'asset/image/2chat.png', name2: 'Dog'),
  DogTop(name: 'Sammy', image: 'asset/image/6dog.png', name2: 'Pat Owner',adopt: true),
  DogTop(name: 'Sam', image: 'asset/image/1chat.png', name2: 'Dog',adopt: true),
  DogTop(name: 'Sammy', image: 'asset/image/6chat.png', name2: 'Pat Owner'),
  DogTop(name: 'Sammuel Jackson', image: 'asset/image/2chat.png', name2: 'Dog'),
  DogTop(name: 'Sammy', image: 'asset/image/6dog.png', name2: 'Pat Owner',adopt: true),
];
const String txtAdopt = 'Adopt';
List<listTag> tagList = [
  listTag(name: '# Dog', name2: '102 Views'),
  listTag(name: '# Dogslover', name2: '150M Views'),
  listTag(name: '# DogLife', name2: '150M Views'),
  listTag(name: '# Dogs', name2: '150k Views'),
  listTag(name: '# Dogslove', name2: '150M Views'),
];

/// Home Screen
const String txtAppBarFriends = 'Friends';
const String txtMyFriends = 'My Friends';
const String txtRequest = 'Request';
const String txtSent = 'Sent';
const String txtFriendList = 'You have 3,781 friends';
const String txtAlvin = 'Alvin C.Sommer ';
const String txtLoreumDummy = 'Lorem  is a simply dummy';
const String txtUnFriends = 'Unfriend';
List<String> listImage = ['asset/image/ic_ellipse.png', 'asset/image/2dog.png', 'asset/image/3dog.png', 'asset/image/4dog.png', 'asset/image/5dog.png', 'asset/image/6dog.png', 'asset/image/7dog.png', 'asset/image/8dog.png', 'asset/image/9dog.png'];

List<alphabetList> listAlphabet = [
  alphabetList(name: 'angel', image: 'asset/image/1chat.png'),
  alphabetList(name: 'bubbly', image: 'asset/image/3chat.png'),
  alphabetList(name: 'Crash TV', image: 'asset/image/4chat.png'),
  alphabetList(name: 'doll', image: 'asset/image/5chat.png'),
  alphabetList(name: 'Ecophobia', image: 'asset/image/6chat.png'),
  alphabetList(name: 'Frozen Gunner', image: 'asset/image/7chat.png'),
  alphabetList(name: 'Glimmer', image: 'asset/image/2chat.png'),
  alphabetList(name: 'Honey', image: 'asset/image/2dog.png'),
  alphabetList(name: 'Littel', image: 'asset/image/3dog.png'),
  alphabetList(name: 'Monsterup', image: 'asset/image/4dog.png'),
  alphabetList(name: 'Naina', image: 'asset/image/5dog.png'),
  alphabetList(name: 'Orange', image: 'asset/image/6dog.png'),
  alphabetList(name: 'Princess', image: 'asset/image/7dog.png'),
  alphabetList(name: 'Riddhi', image: 'asset/image/5dog.png'),
  alphabetList(name: 'Sweet', image: 'asset/image/9dog.png'),
  alphabetList(name: 'Toxic Headshot', image: 'asset/image/2dog.png'),
  alphabetList(name: 'Ultimate Beast', image: 'asset/image/4chat.png'),
  alphabetList(name: 'Wattlexp', image: 'asset/image/5chat.png'),
  alphabetList(name: 'Littel', image: 'asset/image/6chat.png'),
  alphabetList(name: 'Mango', image: 'asset/image/7chat.png'),
  alphabetList(name: 'Pretty', image: 'asset/image/1chat.png'),
  alphabetList(name: 'Zemmiphobia', image: 'asset/image/2chat.png'),
];

/// Chat Screen
const String txtKettyPerry = 'Katy Perry';
const String icReciveMassage = 'asset/image/ic_recivemassage.png';
const String txtHello = 'Hello.I need a help with a topic....';
const String chat1 = 'asset/image/1chat.png';
const String chat2 = 'asset/image/2chat.png';
const String chat3 = 'asset/image/3chat.png';
const String chat4 = 'asset/image/4chat.png';
const String chat5 = 'asset/image/5chat.png';
const String chat6 = 'asset/image/6chat.png';
const String chat7 = 'asset/image/7chat.png';
const String txtMenty = 'Menty Pandey';
const String txtHarry = 'Herry Mens';
const String txtYoung = 'Young Khaui';
const String txtDiego = 'Diego';
const String txtFumio = 'Fumio jion';

List<String> chatImageList = ['asset/image/1chat.png', 'asset/image/2chat.png', 'asset/image/3chat.png', 'asset/image/4chat.png', 'asset/image/5chat.png', 'asset/image/6chat.png', 'asset/image/7chat.png', 'asset/image/ic_wanda.png'];
List<String> nameList = ['katy Parry', 'Menty Pandey', 'Herry Mens', 'Young Khaui', 'Diego', 'Fumio jion', 'Harry Mens', 'Katy Perry'];
List<Dog> riddhi = [
  Dog(name: txtKettyPerry, image: chat1, chatName: 'Hello I need a help with a topic...', time: '2:45'),
  Dog(name: txtMenty, image: chat2, chatName: 'I will do it tomorrow', time: '5:45',),
  Dog(name: txtHarry, image: chat3, chatName: 'Our metting is at 3 o`clock', time: '9:05'),
  Dog(name: txtYoung, image: chat4, chatName: 'Hello', time: '12.00',oneMassage: true),
  Dog(name: txtDiego, image: chat5, chatName: 'Can you share a address', time: '10 Jan',oneMassage: true),
  Dog(name: txtFumio, image: chat6, chatName: 'Yes why not', time: '9 Jan',oneMassage: true),
  Dog(name: txtHarry, image: chat7, chatName: 'I will do it tomorrow', time: '9 Jan',oneMassage: true),
  Dog(name: txtDiego, image: chat1, chatName: 'Hello', time: '8 Jan',oneMassage: true),
  Dog(name: txtFumio, image: chat2, chatName: 'Hi', time: '8 Jan',oneMassage: true),
];

/// Store screen
const String txtStore = 'Store';
const String txtPetStore = 'Pet Stores';
const String txtPetSalon = 'Pet Salon';
const String txtPetRestaurants = 'Pet Restaurants';
const String txtClinics = 'Clinics';
const String txtPetStore1 = 'Pet Store_1';
List<SelectImage> imageList = [
  SelectImage(name: 'Pet Store_1', image: 'asset/image/storesimg1.png', isSelect: false),
  SelectImage(name: 'Pet Store_2', image: 'asset/image/srore.png', isSelect: false),
  SelectImage(name: 'Pet Store_3', image: 'asset/image/srore.png', isSelect: false),
  SelectImage(name: 'Pet Store_4', image: 'asset/image/storesimg1.png', isSelect: false),
  SelectImage(name: 'Pet Store_5', image: 'asset/image/storesimg1.png', isSelect: false),
  SelectImage(name: 'Pet Store_6', image: 'asset/image/srore.png', isSelect: false),
  SelectImage(name: 'Pet Store_7', image: 'asset/image/srore.png', isSelect: false),
  SelectImage(name: 'Pet Store_8', image: 'asset/image/storesimg1.png', isSelect: false),
  SelectImage(name: 'Pet Store_9', image: 'asset/image/storesimg1.png', isSelect: false),
  SelectImage(name: 'Pet Store_10', image: 'asset/image/srore.png', isSelect: false),
  SelectImage(name: 'Pet Store_10', image: 'asset/image/srore.png', isSelect: false),
  SelectImage(name: 'Pet Store_10', image: 'asset/image/srore.png', isSelect: false),
  SelectImage(name: 'Pet Store_10', image: 'asset/image/srore.png', isSelect: false),
  SelectImage(name: 'Pet Store_10', image: 'asset/image/srore.png', isSelect: false),
];

/// PageView HOme Screen
const String txtRussell = 'Russell M.Grover';
const String txtConform = 'Confirm';
const String txtDecline = 'Decline';
const String txtLoremLspum = 'Lorem lpsum';
const String txtRequested = 'Requested';
List<String> requestList = ['asset/image/ic_ellipse.png', 'asset/image/2dog.png', 'asset/image/3dog.png', 'asset/image/4dog.png', 'asset/image/5dog.png', 'asset/image/6dog.png'];

/// Filter Screen
const String txtFilter = 'Filter';
const String txtDogBreeds = 'Dog Breeds';
const String txtAiredale = 'Airedale terrier';
const String txtMale = 'Male';
const String txtFemale = 'Female';
const String txtAge = 'Age';
const String txtBaby = 'Baby';
const String txtYoung1 = 'Young';
const String txtAdult = 'Adult';
const String txtSize = 'Size';
const String txtSmall = 'Small';
const String txtMedium = 'Medium';
const String txtLarge = 'Large';
const String txtOther = 'Other';
const String btnSave = 'Save';
const String txtPetAdopt = 'Pet Adopt';

/// Park Name Info
const String txtParkNameInfo = 'Park Name_1';
const String txtAddress = '2405 Ulrich Road NW,Calgary Canada\n'
    'T2N-4G6';
const String txtWeb = 'www.dogbuddypark1.com';
const String txtNumber = '+ 1 403 7771 156';
const String txtNumber1 = '42865149821321';
const String txtParkTiming = 'Park Timings';
const String txtMonday = 'Monday';
const String txtTIMING = '5 : 00 AM-11 : 30 PM';
List<weekList> week = [
  weekList(name: 'Monday', timing: '5 : 00 AM-11 : 30 PM', color: darkGreen),
  weekList(name: 'Tuesday', timing: '5 : 00 AM-11 : 30 PM', color: darkGreen),
  weekList(name: 'Wednesday', timing: '5 : 00 AM-11 : 30 PM', color: darkGreen),
  weekList(name: 'Thursday', timing: '5 : 00 AM-11 : 30 PM', color: darkGreen),
  weekList(name: 'Friday', timing: '5 : 00 AM-11 : 30 PM', color: darkGreen),
  weekList(name: 'Saturday', timing: '5 : 00 AM-11 : 30 PM', color: darkGreen),
  weekList(name: 'Sunday', timing: 'Closed', color: pink),
];

/// USer Profile Screen
const String txtHitendra = 'Hitendra Soni';
const String txtFollowMeDailyPuppy = 'Follow me for daily Puppy love!';
const String txtEditProfile = 'Edit Profile';
const String txtSammy = 'Sammy';
const String txtJammy = 'Jammy';
const String txtPetList = 'Pet List';
List<listStory> story = [
  listStory(name: 'Sammyfgtymrtdymrfmu6 u', image: 'asset/image/sammy.png'),
  listStory(name: 'Jammy', image: 'asset/image/jammy.png'),
  listStory(name: 'Riddhi', image: 'asset/image/sammy.png'),
];
const String txtAddPet = 'Add Pet';
List<String> userGalleryList = ['asset/image/user_1.png', 'asset/image/user_2.png', 'asset/image/user_3.png', 'asset/image/user_4.png', 'asset/image/user_5.png', 'asset/image/user_11.png', 'asset/image/user_7.png', 'asset/image/user_8.png', 'asset/image/user_9.png', 'asset/image/user_10.png', 'asset/image/user_11.png', 'asset/image/user_12.png'];
const String txtLocationAddress = '2405 Ulrich Road NW,Calgary Canada'
    'T2N-4G6';
const String icBackButton = 'asset/image/ic_BackButton.png';
const String icSetting = 'asset/image/ic_hitendra.png';
const String imgHitendra = 'asset/image/ic_setting.png';
const String icWeb = 'asset/image/user_ic_web.png';
const String icLocation = 'asset/image/user_ic_location.png';
const String imgAddPet = 'asset/image/ic_pet.png';

/// Setting Screen
const String setting = 'Setting';
List<privacyList> privacy = [
  privacyList(image: 'asset/image/ic_privacy.png', name: 'Privacy Policy'),
  privacyList(image: 'asset/image/ic_notification.png', name: 'Notification'),
];
List<privacyList> blockUser = [
  privacyList(image: 'asset/image/ic_blockuser.png', name: 'Block User'),
  privacyList(image: 'asset/image/ic_share_app.png', name: 'Share App'),
  privacyList(image: 'asset/image/ic_feedback.png', name: 'Feedback'),
];
List<privacyList> tc = [
  privacyList(image: 'asset/image/ic_tc.png', name: 'T & C'),
  privacyList(image: 'asset/image/ic_rate_app.png', name: 'Rate App'),
  privacyList(image: 'asset/image/ic_logout.png', name: 'Logout'),
];

/// Notification Screen
const String txtNotification = 'Notifications';
const String txtSandraMinalo = 'Sandra Minalo Commented on your photo Sandra Minalo Commented on your photo Sandra Minalo Commented on your photo';
const String txtTiming = '1h';
const String txtFollow = 'Follow';
List<notificationList> notifications = [
  notificationList(image: 'asset/image/1chat.png', imgDog: 'asset/image/img_notification.png', nameBlack: 'Sandra Minalon', nameGreen: '  Commented on your photo.', nameGrey: '   15min'),
  notificationList(image: 'asset/image/3chat.png', imgDog: 'asset/image/img_notification.png', nameBlack: 'Linnie Lyons', nameGreen: '  Love your comment in your photo.', nameGrey: '  1h', follow: true),
  notificationList(image: 'asset/image/2dog.png', imgDog: 'asset/image/img_notification.png', nameBlack: 'Callie Holland, Emily', nameGreen: '  Loves your photos.', nameGrey: ' 3h', follow: true),
  notificationList(image: 'asset/image/7dog.png', imgDog: 'asset/image/img_notification.png', nameBlack: 'Anni Tran', nameGreen: '  Started following you.', nameGrey: ' 3h'),
  notificationList(image: 'asset/image/6chat.png', imgDog: 'asset/image/img_notification.png', nameBlack: 'Sandra Minalon', nameGreen: '  Commented on your photos.', nameGrey: ' 3min', follow: true),
  notificationList(image: 'asset/image/7chat.png', imgDog: 'asset/image/img_notification.png', nameBlack: 'Linnie Lyons', nameGreen: '  Started favourites your sammy.', nameGrey: ' 4h', follow: true),
  notificationList(image: 'asset/image/5dog.png', imgDog: 'asset/image/img_notification.png', nameBlack: 'Anni Tran', nameGreen: '  Started following you.', nameGrey: ' 4h'),
  notificationList(image: 'asset/image/7dog.png', imgDog: 'asset/image/img_notification.png', nameBlack: 'Linnie Lyons', nameGreen: '  Love your comment in your photo.', nameGrey: ' 1h'),
  notificationList(image: 'asset/image/3chat.png', imgDog: 'asset/image/img_notification.png', nameBlack: 'Callie Holland, Emily', nameGreen: '  Love your photos.', nameGrey: ' 3h', follow: true),
  notificationList(image: 'asset/image/7dog.png', imgDog: 'asset/image/img_notification.png', nameBlack: 'Linnie Lyons ', nameGreen: '  Started favourites your sammy.', nameGrey: '  4h'),
];

/// Sammy Screen
const String txtBabyPuppyFeed = 'Babypuppyfeed';
const String txt308 = '308';
const String txtPost = 'Posts';
const String txt24 = '24.2k';
const String txtFollowers = 'Followers';
const String txt380 = '380';
const String txtFollowing = 'Following';
const String txtLORUM = 'Lorem lpsum is simply dummy text';
List<String> sammyList = [
  'asset/image/user_2.png',
  'asset/image/user_3.png',
  'asset/image/user_4.png',
  'asset/image/user_5.png',
  'asset/image/user_2.png',
  'asset/image/user_7.png',
  'asset/image/user_8.png',
  'asset/image/user_9.png',
  'asset/image/user_10.png',
  'asset/image/user_11.png',
  'asset/image/user_12.png',
  'asset/image/user_10.png',
  'asset/image/user_2.png',
  'asset/image/user_7.png',
  'asset/image/user_8.png',
  'asset/image/user_9.png',
  'asset/image/user_10.png',
];

/// Add Pet Profile Screen
const String txtAddPetProfile = 'Add Pet Profile';
const String txtUploadImage = 'Upload Photo';
const String txtPetName = 'Pet Name';
const String txtPetsName = 'Pet`s Name';
const String txtPetGender = 'Pet Gender';
const String txtPetBreed = 'Pet`s Breed';
const String txtDogSize = 'Dog Size';
const String Address = 'Address';
const String txtAddAnAddress = 'Add An Address';
const String txtEnterYourEmail = 'Enter your Email';
const String txtBirthday = 'Birthday';
const String txtBirthdayDate = '25-1-2000';

/// Dog Details Screen
const String babyPuppyFeed = 'Baby Puppy Feed';
List<dogDetail> dogList = [
  dogDetail(image: 'asset/image/user_1.png'),
  dogDetail(image: 'asset/image/user_2.png'),
  dogDetail(image: 'asset/image/user_3.png'),
  dogDetail(image: 'asset/image/user_4.png'),
  dogDetail(image: 'asset/image/user_5.png'),
  dogDetail(image: 'asset/image/user_7.png'),
  dogDetail(image: 'asset/image/user_8.png'),
  dogDetail(image: 'asset/image/user_9.png'),
  dogDetail(image: 'asset/image/user_10.png'),
  dogDetail(image: 'asset/image/user_11.png'),
  dogDetail(image: 'asset/image/user_12.png'),
  dogDetail(image: 'asset/image/user_10.png'),
  dogDetail(image: 'asset/image/user_8.png'),
  dogDetail(image: 'asset/image/user_9.png'),
  dogDetail(image: 'asset/image/user_10.png'),
  dogDetail(image: 'asset/image/user_11.png'),
];

List<String> ridhi = [
  'angel',
  'angelic',
  'bubbles',
  'baby',
  'bubbly',
  'butterfly',
  'blossom',
  'Breacche',
  'Blikimore',
  'Bootecia',
  'Bookman',
  'BrightHulk',
  'Blue Defender',
  'Bandalls',
  'Blaze Assault',
  'Cryptic Hatter',
  'Crash TV',
  'cherub',
  'Dark Carnage',
  'doll',
  'dolly',
  'shimmer',
  'glimmer',
  'pink',
  'little',
  'sparkly',
  'sweet',
  'sparkles',
  'sweetie',
  'Jack',
  'Qeen',
  'Naina',
  'King',
  'X',
  'Yellow',
  'sprinkles',
  'lolly',
  'princess',
  'fairy',
  'honey',
  'snowflake',
  'pretty',
  'sugar',
  'lovely',
  'Ecophobia',
  'Hippophobia',
  'Scolionophobia',
  'Ergophobia',
  'Musophobia',
  'Zemmiphobia',
  'Geliophobia',
  'Tachophobia',
  'Hadephobia',
  'Radiophobia',
  'Turbo Slayer',
  'Toxic Headshot',
  'Iron Merc',
  'Steel Titan',
  'Stealthed Defender',
  'Venom Fate',
  'Fatal Destiny',
  'Ultimate Beast',
  'Masked Titan',
  'Frozen Gunner',
  'Wattlexp',
  'Sweetiele',
  'HyperYauFarer',
  'Editussion',
  'Experthead',
  'Flamesbria',
  'HeroAnhart',
  'Liveltekah',
  'Linguss',
  'Interestec',
  'FuzzySpuffy',
  'Monsterup',
  'MilkA1Baby',
  'LovesBoost',
  'Edgymnerch',
  'Ortspoon',
  'Oranolio',
  'OneMama',
  'Dravenfact',
  'Reallychel',
  'Reakefit',
  'Popularkiya',
  'StoneWellForever',
  'Simmson',
  'Spuffyffet',
  'Rozalthiric',
];

/// New Contact List
List<contactList> listContact = [
  contactList(name: 'Angle', image: 'asset/image/5chat.png'),
  contactList(name: 'angel', image: 'asset/image/1chat.png'),
  contactList(name: 'bubbly', image: 'asset/image/3chat.png'),
  contactList(name: 'Crash TV', image: 'asset/image/4chat.png'),
  contactList(name: 'doll', image: 'asset/image/5chat.png'),
  contactList(name: 'Ecophobia', image: 'asset/image/6chat.png'),
  contactList(name: 'Frozen Gunner', image: 'asset/image/7chat.png'),
  contactList(name: 'Glimmer', image: 'asset/image/2chat.png'),
  contactList(name: 'Honey', image: 'asset/image/2dog.png'),
  contactList(name: 'Littel', image: 'asset/image/3dog.png'),
  contactList(name: 'Monsterup', image: 'asset/image/4dog.png'),
  contactList(name: 'Naina', image: 'asset/image/5dog.png'),
  contactList(name: 'Orange', image: 'asset/image/6dog.png'),
  contactList(name: 'Princess', image: 'asset/image/7dog.png'),
  contactList(name: 'Riddhi', image: 'asset/image/5dog.png'),
  contactList(name: 'Sweet', image: 'asset/image/9dog.png'),
  contactList(name: 'Toxic Headshot', image: 'asset/image/2dog.png'),
  contactList(name: 'Ultimate Beast', image: 'asset/image/4chat.png'),
  contactList(name: 'Wattlexp', image: 'asset/image/5chat.png'),
  contactList(name: 'Littel', image: 'asset/image/6chat.png'),
  contactList(name: 'Mango', image: 'asset/image/7chat.png'),
  contactList(name: 'Pretty', image: 'asset/image/1chat.png'),
  contactList(name: 'Zemmiphobia', image: 'asset/image/2chat.png'),
];

/// park Screen
const String txtParks = 'Parks';
const String txtGoToPark = 'Go To \nPark';
const String txtSelectYourDogPark = 'Select Your Dog Park';
const String txtSelectPark = 'Select The Pet`s \nGoing To The Park';
List<riddhiPark> parkRiddhi = [
  riddhiPark(image: 'asset/image/park_img2.png', name: 'Sammy', riddhi: false),
  riddhiPark(image: 'asset/image/park_img3.png', name: 'Jammy', riddhi: false),
];
List<parkList> listPark = [
  parkList(name: 'Canada', image: 'asset/image/1.png', isSelect: true, Latitude: 51.060719, Longitude: -114.058620),
  parkList(name: 'Ahmedabad', image: 'asset/image/park_img_2.png', isSelect: false, Latitude: 23.024248, Longitude: 72.581882),
  parkList(name: 'Alfa Mall', image: 'asset/image/park_img_3.png', isSelect: false, Latitude: 23.018383, Longitude: 72.567355),
  parkList(name: 'Kathwada', image: 'asset/image/1.png', isSelect: false, Latitude: 23.0171810, Longitude: 72.642242),
  parkList(name: 'Navrangpura', image: 'asset/image/park_img_2.png', isSelect: false, Latitude: 22.954440, Longitude: 72.454959),
  parkList(name: 'Gandhinagar', image: 'asset/image/park_img_3.png', isSelect: false, Latitude: 23.203064, Longitude: 72.690027),
];
const String txtDogPark = 'Dog Park';
List<String> listDog = [
  'asset/image/park_img1.png',
  'asset/image/park_img2.png',
  'asset/image/park_img3.png',
  'asset/image/park_img4.png',
  'asset/image/park_img5.png',
  'asset/image/park_img6.png',
];

/// Comment Screen
const String txtComment = 'Comments';
List<commentList> listComment = [
  commentList(image: 'asset/image/1chat.png', name: txtSamm, nameGrey: '   How are you?', nameGreen: '\n1h  1 like Replay', like: true),
  commentList(image: 'asset/image/6dog.png', name: 'Sammuel jackson', nameGrey: '   nice', nameGreen: '\n1h   like Replay', like: true),
  commentList(image: 'asset/image/3chat.png', name: 'sam', nameGrey: '   When we meet in park?', nameGreen: '\n1h  1 like Replay', like: true),
  commentList(image: 'asset/image/4chat.png', name: 'sammy', nameGrey: '   Hi?', nameGreen: '\n2h  1 like Replay', like: true),
  commentList(image: 'asset/image/7chat.png', name: 'Sammuel jackson', nameGrey: '   When we meet in park?', nameGreen: '\n1h  1 like Replay', like: true),
  commentList(image: 'asset/image/8dog.png', name: txtSamm, nameGrey: '   How are you', nameGreen: '\n30min like Replay', like: false),
  commentList(image: 'asset/image/9dog.png', name: 'Sammy', nameGrey: '   Hello', nameGreen: '\n2h 1 like Replay', like: true),
  commentList(image: 'asset/image/7dog.png', name: 'Sam', nameGrey: '   When we meet in park?', nameGreen: '\n1h   like Replay', like: false),
];
const String txtType = 'Type a message here...';

/// Dog breed
const String txtIAmNotSure = 'i`m not sure';
