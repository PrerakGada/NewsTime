import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: Text(
            "Privacy Policy",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              // color: AppColors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                  child: RichText(
                                text: TextSpan(
                                  text: 'CitJo – COMMUNITY GUIDELINES',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14.0),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "\n" +
                                          '''
 
About  


CitJo (“CitJo”, “we”, “us”, “our”, “App”) is a platform for you (“User”, “You”, “Your”) to create,  
share and upload content, and we wish to make this platform safe and enjoyable for You and the society at large, as much as possible. To this end, we have set out certain guidelines here (“Community Guidelines”) for sharing content on CitJo, so that we can make the App an inclusive, secure, free space for You to  
express yourself and benefit from it.  
 
We want informative and useful content to reach You through CitJo, and prohibit the following categories of information from being shared on the App.  
 
1. Violent Content  


You agree that You will not create, share or upload any content which:  


Incites, promotes or glorifies violent behavior;  
Expresses a threat or intent to commit a violent act towards any person(s), place (s), or physical structure(s) including the place(s) of worship;  
Acts as a call for a commission of violence towards any person(s), place (s), or physical structure(s) including the place(s) of worship or incites the commission of a cognizable offence under any Indian law;  
Encourages or threatens or expresses intention towards the commission of any act of self-harm, including suicide; and  
Offers to provide services, weapons or other resources for committing any act of violence.  
 
2. Adult Content  
 
You agree that You will not create, share or upload any content which may be considered pornographic such as:  
 
Any depiction of the exposed private areas of individuals;  
Content that is obscene, or content capturing intimate images of a person without their consent by violating the privacy of that person;
Images or videos showing persons engaging in sexual activities;  
Intimate or sexual imagery or videos obtained and/or published without the consent of the subject of such imagery;  
Solicitation for sexual acts from, or arranging sexual encounters with, adults and/or minors;  
Encourages, promotes, or threatens commission of acts of sexual violence and abuse;
Shows individuals in full or partial nudity; and
Is in the nature of impersonation in an electronic form, including artificially morphed images of such individuals.  
 
3. Hateful Content  
 
CitJo is committed to creating a welcoming and safe platform for all its Users and help the society, and hence You agree that You will not upload any content which:  
 
Attacks, mocks, negatively stereotypes or otherwise expresses disgust, inferiority or condemnation for any group of people based on their identity such as gender, sexual orientation, caste, religion, ethnicity, race, nationality, language, etc.;  
Suggests, advocates or promotes discrimination against any such group of persons including exclusion from social, educational, employment and political opportunities, denial of civil liberties, and socio-cultural segregation;  
Encourages, incites or glorifies committing acts of violence or crime against any such group of persons including calls for mass-murder/rape of members of any community, mass assault on members of any community, destruction of private property, destruction of symbols, places of CitJo gathering/worship of such communities, and forced exile or religious conversions or marriages of members of a community which affects the peace and tranquility in the society; 
Insults the religion or religious beliefs of any class with or without the deliberate and malicious intention;  
Insults or intimidates or promotes feelings of enmity towards members of a lower caste or any caste or tribe or promotes the practice of untouchability of any kind; and  
In any manner, attacks other marginalized communities or vulnerable groups based on their low socio-economic status, weight, size, age, caste or any protected category under Indian anti-discrimination law.  
 
We note that certain categories of hateful content may be permitted to be displayed on the App, only if such content is a part of any newsworthy occurrence that is being reported by a User, without any endorsement of such content by the User, and if the reporting is in line with CitJo interest and does not fall afoul of the other requirements under these Community Guidelines. 
 
4. Unoriginal Content  
 
CitJo does not allow any content which:  
 
A User is not rightfully authorised to share on the App;  
Infringes on the copyright, trademark or any other intellectual property right of another person;  
Impersonates another person or group wrongfully, with an intent to pass off as such person/group and mislead other Users of the real identity of the impersonating User; and  
Misrepresents information about any User by providing inaccurate information about such User, creating fake profiles, etc.  
5. Inauthentic and Misleading Content  
 
You agree that You will share accurate representations of the events You are reporting on, and will not create, upload or share any content which:  
 
Deceives or misleads the addressee about the origin of the message;  
Provides factually inaccurate information on any subject;  
Communicates any information which is patently false or misleading in nature but may
reasonably be perceived as a fact;  
Misrepresents any aspect of the subject matter of the content that is shared, except to the extent clearly identifiable as satire but does not cause social problems;  
Misleads Users on matters of CitJo interest (for example, health, elections, CitJo events, etc.);  
Misleads the CitJo with an intent to promote hatred, discrimination or prejudice towards any particular person or group of persons;  
Is patently false and untrue, and is written or published, with the intent to mislead or harass a person, entity or agency for financial gain or to cause any injury to any person;  
Violates the Norms of Journalistic Conduct by the Press Council of India;  
Lifts news from newspapers or other news sources to publish them subsequently on the CitJo account as original reporting;  
Is in the form of a heavily edited or manipulated video/image or is a product of artificial intelligence of a previous work that seeks to present itself as original content; and  
Misinformation relating to the ongoing COVID-19 pandemic, including any content which  
 
may lead to panic among the viewers and disturb the CitJo order and social tranquility;
consists of unverified information on resources for COVID-19 support and relief; and  
uses the expression “Indian variant” in posts relating to the COVID-19 pandemic.  
 
 
6. Content Harming Minors 
 
You will not share any content that is harmful to minors, such as:  
 
Any content that depicts minors engaging in any sexually explicit act exposes their private parts, presents minors in a sexualized manner, or depicts child sexual abuse;  
Material depicting children in obscene or indecent or sexually explicit manner;  
Content that entices or induces children to online relationships with other children or adults for sexually explicit acts;  
Content promoting child labour;  
Recording of own abuse or that of others pertaining to sexually explicit acts with children;  
Reports regarding inquiries, investigations or judicial procedures which discloses details which would identify a child in conflict with law, child in need of care and protection, child victim / witness involved in such a matter; and  
Reports which disclose name/s and/or picture/s of victims of sexual exploitation as barred by law.  
 
7. Other Prohibited Content  
 
The following content categories may not be shared on CitJo, such as:  
 
Any commercial content or sponsored content that is passed off as news without disclosure of commercial affiliation;  
Content that mischaracterizes any goods or services with the intention of inducing the purchase of such goods or services;  
Content on election-related matters for certain periods around elections as specified in election laws, and political advertising prohibited under various election laws;  
Calls for committing any criminal acts towards a (group of) person(s) (for example: assaulting, abducting or killing) or property (for example theft, vandalism, etc.) or animals, in particular, content that promotes desecration of places of worship;  
Content promoting the sale of illegal items such as firearms, human organs, hallucinogens, etc.;  
Disparaging, scandalous and otherwise insulting statements towards any person/s that may be defamatory or libelous in nature;  
Advertisements relating to pre-natal sex determination;  
Content which promotes solicits or facilitates human trafficking, bonded labour, sex trafficking, child labour and conscription and other forms of human sale, servitude and exploitation;  
Material which reveals any individual’s sensitive personal data or information such as medical records, financial information, etc.;  
Content which is grossly harmful, harassing, blasphemous, invasive of another's privacy, hateful, or racially, ethnically objectionable, disparaging, relating to or encouraging money laundering or gambling;  
Content that threatens the unity, integrity, defences, security or sovereignty of India, friendly relations with foreign states, or CitJo order or is insulting to any other nation;  
Content that amounts to any offence under any criminal law or is otherwise prohibited under any applicable law;  
Graphic content depicting victims of accidents, crimes, calamities or any other violent incidents;  
 
8. Access to user’s device location permission
 
For our app to work efficiently & to provide related content to users, we need the location permission of the user's device, for features such as:
 
For us to show users local news of their locality or of the preferred location;
To show news/videos of the language they have chosen as their preference;
To publish & show the content of the uploader in their selected region;
 
9. Enforcement  
 
If You post any content on the App which violates these Community Guidelines, We will remove the content from the App and may suspend or terminate Your account at Our sole discretion.  
 
We also want to make You a partner in strengthening Our platform and welcome You to report any content on the App which falls under any of the prohibited categories of content. You can inform Us of such a violation by clicking on the “Report” button in the App or by writing to at info@citjo.in  with (a) a screenshot or sharing the link of the infringing post, and (b)  
explanation of how such content violates the Community Guidelines set out herein.  
 
Your reports of violation of these Community Guidelines will be received and acknowledged within 24 hours by Us. We will respond promptly to Your reports of violations (within 15 days of the receipt of Your report) by:  
 
Taking down such violating content; or  
Suspending/blocking the violating User’s account; or  
Terminating the violating Users’ access to the App.  
 
All Our decisions above will be notified to the violating User, along with Our reasons for such decision.  
 
Notwithstanding anything contained in these Community Guidelines, upon receiving any complaints relating to the content that falls under categories (1) to (7) of these Community Guidelines, We will endeavour to act within twenty-four (24) hours to address Your concern.
  
Our content moderation team’s assessment of any complaints relating to the content shared on the App will be limited to whether such content violates these Community Guidelines or Our other policies or those of the government of India. Such a decision will be final and binding as regards content on the App. We do not undertake any legal analysis or judgement on the nature of all reported content.
 
If You have any objections against any action taken by Us, You can inform Us of Your reasons for such objections and request reinstatement of Your content by writing to Us at info@citjo.in We will review Your objections, and reserve the right to modify/retain Our decision on any complaint against content shared on the App.  


''',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
