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
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: HomePage(),
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
      salaryRange: '\$90 - \$120K'
    ),
    Jobs(
      jobPosition: 'UX Engineer',
      companyName: 'UBER',
      location: 'San Fransisco, USA',
      salaryRange: '\$65 - \$80K'
    ),
    Jobs(
      jobPosition: 'UX Designer',
      companyName: 'Microsoft',
      location: 'Washington DC, USA',
      salaryRange: '\$65 - \$90K'
    )
  ];

  List<Jobs> recentJobs = [
    Jobs(
      jobPosition: 'Senior UX Designer',
      companyName: 'Apple Inc.',
      location: 'California, United States',
      salaryRange: '\$110 - \$130K'
    ),
    Jobs(
      jobPosition: 'Software Engineer - Web',
      companyName: 'Reddit',
      location: 'California, United States',
      salaryRange: '\$60 - \$75K'
    )
  ];

  bool _bookmarkJob = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLightGrey,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Kaz',
              style: GoogleFonts.poppins(
                color: kBlack,
                fontWeight: FontWeight.w800
              ),
            ),
            Text(
              'ki',
              style: GoogleFonts.poppins(
                color: kOrange,
                fontWeight: FontWeight.w800
              )
            )
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(kSafePadding, kSafePadding, kSafePadding, 0),
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
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(kSafePadding, kSafePadding, kSafePadding, 0),
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
                  ListView.builder(
                    shrinkWrap: true,
                    // scrollDirection: Axis.horizontal,
                    itemCount: recommendedJobs.length,
                    itemBuilder: (context, index) {
                      return Container(
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
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              recommendedJobs[index].jobPosition,
                              style: GoogleFonts.lato(
                                color: kBlack,
                                fontSize: 18.0,
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
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(kSafePadding),
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
                      return Container(
                        padding: EdgeInsets.symmetric(
                          vertical: kSafePadding,
                          horizontal: 1.5*kSafePadding
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: kLightGrey
                          )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  recentJobs[index].jobPosition,
                                  style: GoogleFonts.lato(
                                    color: kBlack,
                                    fontSize: 18.0,
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
                            IconButton(
                              icon: _bookmarkJob == true ? Icon(Icons.bookmark, color: kOrange) : Icon(Icons.bookmark_border, color: kDarkGrey),
                              onPressed: () {
                                setState(() {
                                  _bookmarkJob = !_bookmarkJob;
                                });
                              }
                            )
                          ],
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