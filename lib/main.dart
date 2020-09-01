import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kazki_mobile/constants.dart';
import 'package:kazki_mobile/jobs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kazki',
      theme: ThemeData.light(),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  String displayName;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(kSafePadding),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Kaz',
                      style: GoogleFonts.poppins(
                        color: kBlack,
                        fontSize: 48.0,
                        fontWeight: FontWeight.w800
                      ),
                    ),
                    Text(
                      'ki',
                      style: GoogleFonts.poppins(
                        color: kOrange,
                        fontSize: 48.0,
                        fontWeight: FontWeight.w800
                      )
                    )
                  ],
                ),
              ),
              SizedBox(height: 2*kSafePadding),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'What is your name?',
                      style: GoogleFonts.poppins(
                        color: kBlack,
                        fontWeight: FontWeight.w500
                      )
                    ),
                    SizedBox(height: 2*kBasePadding),
                    Container(
                      height: 12*kBasePadding,
                      padding: EdgeInsets.symmetric(horizontal: kSafePadding),
                      decoration: BoxDecoration(
                        color: kWhite,
                        border: Border.all(
                          color: kLightGrey
                        ),
                        borderRadius: BorderRadius.circular(8.0)
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Input your name'
                        ),
                        onChanged: (input) {
                          displayName = input;
                        },
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 2*kSafePadding),
              FlatButton(
                color: kOrange,
                onPressed: () {
                  if(displayName != null) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return HomePage(displayName: displayName);
                    }));
                  } else {
                    return null;
                  }
                },
                child: Text(
                  'NEXT',
                  style: GoogleFonts.lato(
                    color: kWhite,
                    fontWeight: FontWeight.w500
                  )
                )
              )
            ],
          )
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final String displayName;

  HomePage({ this.displayName });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Jobs> recommendedJobs = [
    Jobs(
      jobPosition: 'Product Designer',
      companyName: 'Google',
      location: 'Stockholm, Sweden',
      salaryRange: '\$90 - \$120K',
      logoName: 'google.png',
      savedJob: false
    ),
    Jobs(
      jobPosition: 'UX Engineer',
      companyName: 'UBER',
      location: 'San Fransisco, USA',
      salaryRange: '\$65 - \$80K',
      logoName: 'uber.png',
      savedJob: false
    ),
    Jobs(
      jobPosition: 'UX Designer',
      companyName: 'Microsoft',
      location: 'Washington DC, USA',
      salaryRange: '\$65 - \$90K',
      logoName: 'microsoft.png',
      savedJob: false
    )
  ];

  List<Jobs> recentJobs = [
    Jobs(
      jobPosition: 'Senior UX Designer',
      companyName: 'Apple Inc.',
      location: 'California, United States',
      salaryRange: '\$110 - \$130K',
      logoName: 'apple.png',
      savedJob: false
    ),
    Jobs(
      jobPosition: 'Software Engineer - Web',
      companyName: 'Reddit',
      location: 'California, United States',
      salaryRange: '\$60 - \$75K',
      logoName: 'reddit.png',
      savedJob: false
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLightGrey,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            text: 'Kaz',
            style: GoogleFonts.poppins(
              color: kBlack,
              fontSize: 20.0,
              fontWeight: FontWeight.w800
            ),
            children: <TextSpan> [
              TextSpan(
                text: 'ki',
                style: GoogleFonts.poppins(
                  color: kOrange,
                  fontWeight: FontWeight.w800
                )
              )
            ]
          )
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: kDarkGrey,
            ),
            onPressed: () {
              Navigator.pop(context);
            }
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(kSafePadding, 2*kSafePadding, kSafePadding, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello ${widget.displayName},',
                    style: GoogleFonts.lato(
                      color: kDarkGrey,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500
                    )
                  ),
                  SizedBox(height: 2.0),
                  Text(
                    'Let\'s Find Your Job',
                    style: GoogleFonts.poppins(
                      color: kBlack,
                      fontSize: 26.0,
                      fontWeight: FontWeight.w800
                    )
                  )
                ],
              ),
            ),
            SizedBox(height: 1.5*kSafePadding),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: kSafePadding),
                    child: Text(
                      'Recommended Jobs',
                      style: GoogleFonts.poppins(
                        color: kBlack,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  SizedBox(height: 2*kBasePadding),
                  Container(
                    height: 12*kSafePadding,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: recommendedJobs.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            
                          },
                          child: Container(
                            width: 10*kSafePadding,
                            margin: index != recommendedJobs.length-1 ? EdgeInsets.only(left: kSafePadding) : EdgeInsets.symmetric(horizontal: kSafePadding),
                            padding: EdgeInsets.symmetric(
                              vertical: kSafePadding,
                              horizontal: 2*kBasePadding
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: kLightGrey
                              )
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/${recommendedJobs[index].logoName}',
                                  scale: 2.0,
                                ),
                                SizedBox(height: kSafePadding),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      recommendedJobs[index].jobPosition,
                                      style: GoogleFonts.lato(
                                        color: kBlack,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700
                                      )
                                    ),
                                    SizedBox(height: 2.0),
                                    Text(
                                      recommendedJobs[index].companyName,
                                      style: GoogleFonts.lato(
                                        color: kDarkGrey,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700
                                      )
                                    ),
                                    SizedBox(height: 4.0),
                                    Text(
                                      recommendedJobs[index].location,
                                      style: GoogleFonts.lato(
                                        color: kDarkGrey,
                                      )
                                    ),
                                    SizedBox(height: 4.0),
                                    Text(
                                      recommendedJobs[index].salaryRange,
                                      style: GoogleFonts.lato(
                                        color: kDarkGrey,
                                        fontWeight: FontWeight.w600
                                      )
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 1.5*kSafePadding),
            Container(
              padding: EdgeInsets.symmetric(horizontal: kSafePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent Jobs',
                    style: GoogleFonts.poppins(
                      color: kBlack,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(height: 2*kBasePadding),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: recentJobs.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {

                        },
                        child: Container(
                          margin: index != recentJobs.length-1 ? EdgeInsets.only(bottom: kSafePadding) : EdgeInsets.all(0),
                          padding: EdgeInsets.all(kSafePadding),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: kLightGrey
                            )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/${recentJobs[index].logoName}',
                                      scale: 2.0,
                                    ),
                                    SizedBox(width: kSafePadding),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          recentJobs[index].jobPosition,
                                          style: GoogleFonts.lato(
                                            color: kBlack,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w700
                                          )
                                        ),
                                        SizedBox(height: 2.0),
                                        Text(
                                          recentJobs[index].companyName,
                                          style: GoogleFonts.lato(
                                            color: kDarkGrey,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w700
                                          )
                                        ),
                                        SizedBox(height: 4.0),
                                        Text(
                                          recentJobs[index].location,
                                          style: GoogleFonts.lato(
                                            color: kDarkGrey,
                                          )
                                        ),
                                        SizedBox(height: 4.0),
                                        Text(
                                          recentJobs[index].salaryRange,
                                          style: GoogleFonts.lato(
                                            color: kDarkGrey,
                                            fontWeight: FontWeight.w600
                                          )
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: recentJobs[index].savedJob == true ? Icon(Icons.bookmark, color: kOrange) : Icon(Icons.bookmark_border, color: kDarkGrey),
                                onPressed: () {
                                  setState(() {
                                    recentJobs[index].savedJob = !recentJobs[index].savedJob;
                                  });
                                }
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}