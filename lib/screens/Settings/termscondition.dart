import 'package:flutter/material.dart';

class TermsConditions extends StatefulWidget {
  const TermsConditions({Key? key}) : super(key: key);

  @override
  State<TermsConditions> createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          "Terms & Conditions",
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
                                text: '',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: "\n" +
                                          '''
 
These terms and conditions of use (“Terms”) along with privacy policy (“Privacy Policy”) form a legally binding agreement (“Agreement”) between You and Us (“CITJO GLOBAL PVT LTD.”, “CitJo”, “Our”, “We”). Hence, we insist that you spend time reading these Terms and Privacy Policy and let us know at hellp@CitJo.in if you have any questions regarding the same.

DEFINITIONS AND INTERPRETATIONS
Capitalized terms, not defined elsewhere in this Agreement, shall mean as follows:

“App” means the CitJo mobile platform downloadable from Google Play/AppStore and owned by us, including any updates thereof. “Google Play Store” means the service provided by Google Ireland Limited and/or its affiliates, a third -party, through which you may use in order to download the App.

“Google PlayStore Terms and Conditions” means terms and conditions that apply to the use of the AppStore platform and as available at Play Store.

“Sponsored Content” means content distinct from other regular editorial content displayed on the App, in the form of audio, video, text, and/or image media that supports a third party Person's brand message or views that are readily identifiable upfront through distinct and distinguishable font, color, display schemes and/or usage of disclaiming words other than those used for regular editorial content (such as “Ad”, “Powered by”, “Sponsored by”, “With”, “Advertorial” and such other phrase of like meaning).

User” or “You” or “Your” refers to a person who has accepted this Agreement in order to “download and use the App.
Any reference to the singular includes a reference to the plural and vice versa, and any reference to one gender includes a reference to another gender(s) unless explicitly provided for.
Headings and captions are used for convenience only and not for interpretation of the agreement. Any reference to a natural person shall include his/her heirs, executors, and permitted assignees and any reference to a juristic person shall, include its affiliates, successors, and permitted assignees, unless repugnant to the context.
YOUR APPROVAL
You approve of and accept the Agreement by:
downloading and/or installing the App on Your device, or
accessing or using the App or any of the content available within the App from any device.
You can accept the Agreement only if:
You are a natural person of the legal age to consent in your jurisdiction and of sound mind to form a binding contract with CitJo pursuant to Your use of the App; or
You are a juristic person, lawfully existing that has all the authorizations, permits, and allowances to enter into this Agreement and form a binding contract; and,
You are not legally barred under applicable laws from using the App. You understand that we want you to not use the App if you do not understand, approve of or accept the Agreement in its entirety. Hence, You are requested to read these Terms and Privacy Policy carefully and understand the Agreement before You accept it and agree to be bound by them.
PROVISION OF THE APP
The App is designed to provide you with an in-app browsing experience. The App displays third-party content within one platform and makes it available in video format, for easy access by You and for assisting You to find corresponding content of Your interest.
The App does not host, display or transmit any content owned by third parties on its servers unless We either have a license to host, display or transmit over such content or are otherwise permitted under the applicable laws to do the same.
You agree and acknowledge that CitJo is only an intermediary and that the App does not provide any content of its own accord and is not responsible or liable for the content or accuracy of the summary of the content that may be accessed by You through the App.
The App may include links to other mobile applications and/or websites (some of which may be automated search results) which may contain materials that are objectionable, unlawful, or inaccurate. We do not endorse or support these links or the products and services they provide; these links are provided for your convenience only. We are not responsible or liable for the content or accuracy of such links.
In order to access the App, You have to register as a User by providing prescribed information which will be governed by our Privacy Policy.
You agree and acknowledge that certain Sponsored Content may be placed on, about, or in conjunction with the other content within the App.
You agree and acknowledge the following representations at all times while using the App:
Any information that You provide is true, accurate, complete, and updated;
You will only use the content of the App for non-commercial and personal purposes;
You will not use the App or any content provided thereof for any purpose that is illegal, unlawful, or prohibited by this Agreement;
You will not copy, reproduce, alter, modify, create derivative works of, or publicly display any content displayed on the App; and.
You will not confer any of Your rights to any third parties.
You agree that if you are a content provider, and there are links to your content shared on the App, you will provide such information as may be required under applicable laws to the relevant government authorities, including but not limited to details of your registered user account on the App products, and any other information that may be requested from you.
You acknowledge that we will not be liable for the accuracy, validity, or authenticity of any information disclosed by You in furtherance of Your obligations under applicable laws, including in response to any requests from relevant government authorities.
We may stop the provision of the App (or any part of the App), permanently or temporarily, to You or to users generally or may modify or change the nature of the App and/or these Terms at Our sole discretion, without any prior notice to You. Your use of the App following any such modification constitutes Your deemed acceptance to be bound by any and all the Agreement (or as it may be modified).
YOUR AGREEMENT WITH CitJo
A violation of any provisions of this Agreement may result in a legal liability upon You and nothing in this Agreement should be construed to confer any rights to any third party. You are responsible for Your conduct and activities while using the App, and for any consequences thereof.
If any provision of the Agreement is found to be unenforceable under the applicable law, it will not affect the validity and enforceability of the other provisions of this Agreement. Such unenforceable provision shall be deemed superseded by a valid enforceable provision that most closely matches the intent of the original provision.
We may choose to not act with respect to a breach of this Agreement by You or others but this does not preclude our legal right against You with respect to subsequent similar breaches. Our failure to exercise or enforce any provision of this Agreement shall not constitute a waiver of such right or provision.
USING THE APP
You will download and install the App from Google Play for using it.
You will also download and update the relevant latest versions of the App and any relevant updates provided by Us to avail continued access to the App.
You will use the App only for such purposes as is permitted by (a) this Agreement; and (b) any law, regulation or generally accepted practices or guidelines applicable in the country of which You are a citizen, in which You are a resident or from where You use the App.
For any content you create using the App, You grant Us a limited, non-exclusive, transferable, assignable license to use the same in accordance with the terms and conditions, privacy policy, content regulation policy, any other policy of Us, and any agreement executed by You and Us, and such a license/agreement will include Our right to sub-license.
For your use of the App, CitJo grants you a limited, non-exclusive, non-transferable right to install and use the App on Your android device. However, You shall not copy the App or any of its components, except for the purpose of making a single archival backup copy.
CitJo also grants You a non-exclusive, non-transferable license to access such content on the App which is owned by CitJo. For using any content owned by a third party, You still require a license from such a third party, We don't license such content to You and Your use of content owned by a third party is governed by applicable terms and conditions prescribed by such third party.
RESTRICTIONS ON YOUR USE
You agree and acknowledge that You will not host, display, upload, modify, publish, transmit, update or share any information that:
belongs to another person and to which the User does not have any right;
is defamatory, obscene, pornographic, paedophilic, invasive of another's privacy, including bodily privacy, insulting or harassing on the basis of gender, libellous, racially or ethnically objectionable, relating or encouraging money laundering or gambling, or otherwise inconsistent with or contrary to the laws in force;
Is harmful to a child;
infringes any patent, trademark, copyright, or other proprietary rights;
violates any law for the time being in force;
deceives or misleads the addressee about the origin of the message or knowingly or intentionally communicates any information which is patently false or misleading in nature but may reasonably be perceived as a fact;
impersonates another person; (threatens the unity, integrity, defense, security or sovereignty of India, friendly relations with foreign states, or public order, or causes incitement to the commission of any cognizable offence or prevents investigation of any offence or is insulting other nation;
contains a software virus or any other computer code, file, or program designed to interrupt, destroy or limit the functionality of any computer resource;
is patently false and untrue, and is written or published in any form, with the intent to mislead or harass a person, entity or agency for financial gain or to cause any injury to any person; or
is in the nature of any material which exposes the private area of such individual, shows such individual in full or partial nudity or shows or depicts such individual in any sexual act or conduct, or is in the nature of impersonation in an electronic form, including artificially morphed images of such individual.
You will not access (or attempt to access) the content provided through the App by any means other than through the App unless You have been specifically allowed to do so in a separate written agreement with CitJo.
You will not redistribute, sublicense, rent, publish, sell, assign, lease, market, transfer, or otherwise make the App or any component or content thereof, available to third parties.
You will not circumvent or disable any digital rights management, usage rules, or other security features of the App; remove, alter, or obscure any proprietary notices (including copyright notices) on any portion of the App; and not use the App in a manner that threatens the integrity, performance, or availability of the App.
You will not attempt to or engage in any activity that may:
reverse engineer, decompile, or otherwise extract the source code related to the App or any part thereof unless it is expressly permitted by CitJo in writing or is required by the applicable law;
collect information about users of the App for any illegal or unlawful purpose;
create any user accounts by automated means or under false or fraudulent pretences for using App;
transmit any viruses, worms, defects, Trojan horses, or any items of a destructive nature through App;
use the App in any manner that could damage, disable, overburden, impair, or undertake any action which is harmful or potentially harmful to, any of the servers, networks, computer systems, or resources connected to any of the servers connected, directly or indirectly to the App, or interfere with any other Users' use and enjoyment of the App;
carry out any denial of service (DoS, DDoS) or any other harmful attacks on the App or;
disrupt or place unreasonable burdens or excessive loads on, or interfere with or attempt to make, or attempt any unauthorized access to the App or any part of the App or any user of the App;
forge headers or otherwise manipulate identifiers in order to disguise the origin of any content transmitted through the App; or
obtain any materials or information through any means not intentionally made available, in the opinion of CitJo, through the App.
You will not impersonate another person or impersonate guide, or host on behalf of, or falsely state or otherwise misrepresent Your affiliation with any person or entity, including, but not limited to Our officials, employees, agents, partners, affiliates, dealers, and franchisees.
REPORTING VIOLATIONS AND CONTENT TAKEN DOWN
You can report any violation of these Terms by writing to us at info@citjo.in and we will endeavour to address your concern within 15 days.
We will review Your objections, and reserve the right to modify/retain our decision on any complaint against content shared on the App.
Access to user's device background location permission
For our app to work efficiently & to provide related content to users, we need the location permission of the user's device, for features such as:

For us to show users local news of their locality or of the preferred location;
To show news/videos of the language they have chosen as their preference;
To publish & show the content of the uploader in their selected region;
For a better in-app experience for users, we require the user's device's background location permission;
TERMINATION
Your access to the App may be terminated if:
You voluntarily uninstall the App from Your device;
You knowingly or unknowingly cause a direct or indirect breach, as ascertained by CitJo, of this Agreement as a whole or in part or any applicable laws. We are required to do so by law (for example, where the access to and/or provision of the App to You becomes, unlawful);
The third party, if any, with whom We offered the App to You has terminated its relationship with Us or ceased to offer the related services to Us or to You;
The provision of App to You is no longer commercially viable or feasible for Us; or
CitJo may terminate Your usage of the App at any time, with or without notice, and may procure disabling Your access to the App and/or barring You from any future use of the App.
You may terminate your agreement with CitJo at any time by terminating Your access to the App. However, Your certain obligations under this Agreement shall continue to prevail even on such termination.
When your agreement with CitJo comes to an end, all of the legal rights, obligations, and liabilities that You and CitJo have benefited from arising out of or in connection with this Agreement, or which are expressed to continue indefinitely, shall be unaffected by this cessation and shall continue to apply to such rights, obligations, and liabilities indefinitely.
INTELLECTUAL PROPERTY
Your use of the App is, and at all times shall be, governed by and subject to the laws regarding copyright, trademark, patent, and trade secret ownership and use of the intellectual property. You agree to abide by laws regarding copyright, trademark, patent, and trade secret ownership and use of intellectual property, and You shall be solely responsible for any violations of any laws and for any infringements of any intellectual property rights caused by Your use of the App through Your device.
CitJo owns and retains all the intellectual property rights to the summarized content made available to You through the App by CitJo but does not claim ownership rights to the original sources of information, which are instead held by the sites to which the App may link You.
All trademarks, brands, and service marks of the App are the property of CitJo only. CitJo owns all of the copyrights and database in relation to the App. The content included on this website, including, but not limited to the CitJo tests, reports, text, graphics, logos, icons, and images is the exclusive property of CitJo and other respective owners that have granted CitJo the right and license to use such property and is protected by Indian and international copyright laws. All trademarks, service marks, and trade names are proprietary to CitJo or other respective owners that have granted CitJo the right and license to use such marks.
The App and any underlying technology or software used in connection with the App may contain the rights of CitJo or its affiliates or any third party. For use of any third party's intellectual property, You may need to get permission directly from the owner of the intellectual property.
Any intellectual property which is not specifically mentioned to be owned by CitJo is owned by their respective owners, and the owners have a right to take appropriate actions against You for any violation, infringement, or passing off.
CitJo respects the intellectual property rights of others and does not hold any responsibility for any violations of any intellectual property rights by You.
PRIVACY
Our Privacy Policy explains how We treat Your personal data and protect Your privacy when You use the App. By using the App, You agree that We can use such data according to Privacy Policy.
You are responsible for maintaining the confidentiality of passwords associated with any device You use to access the App. Accordingly, You are solely responsible for all activities that occur with Your device.
If You become aware of any unauthorized use of Your device, You will notify the relevant authorities as soon as possible.
LIMITATION OF LIABILITY AND INDEMNIFICATION
Your use of the App or any content available thereof is entirely at Your own risk and We shall not be liable for any direct, indirect, incidental, consequential, special, exemplary, punitive, monetary, or any other damages, fees, fines, penalties or liabilities whatsoever arising out of or relating to Your use of the app.
You may terminate Your access to the App if You are not satisfied with the app.
You shall defend, indemnify and hold CitJo, and its officers, directors, employees, representatives, and agents harmless from and against any claims, actions, demands, liabilities, judgments, and settlements, including without limitation, reasonable legal fees that may result from or alleged to result from:
Your use of the App; or
Your breach of any rules, regulations, and/or orders under any applicable law.
You are also responsible for any breach of Your obligations under the Agreement and/or for the consequences of any such breach.
NO WARRANTIES
We shall make our best efforts to make the App available to You in the best possible manner. We disclaim all warranties in relation to the app, whether express or implied, including but not limited to:
the App being constantly available or available at all;
installation or un-installation choices in relation to the App being successfully executed in all cases
that App will always function without disruptions, delays, or errors;
Your personal ability to use the App;
Your satisfaction with the use of the App;
the accuracy of the data provided by the App;
the security and privacy of Your data;
that all bugs or errors in relation to the App will be corrected;
that the App will be compatible with all devices and all networks;
that the App is fit for a particular purpose or use, or that the App and the contents thereof are accessible in every location.
CitJo, its officers, directors, employees, affiliates and agents, and any other service provider responsible for providing access to the App in connection with this Agreement will not be liable for any acts or omissions, including of a third party, and including those vendors participating in CitJo' offerings made to You, or for any unauthorized interception of data or breaches of this Agreement attributable in part to the acts or omissions of third parties, or for damages associated with CitJo, or equipment that it does not furnish, or for damages that result from the operation systems, equipment, facilities or services provided by third parties that are interconnected with CitJo.
GOVERNING LAW AND DISPUTE RESOLUTION
The App may be controlled and operated in any country and may be subject to the laws of that country in which they are controlled and operated. If You use the App from any location, then, You are responsible for compliance with the local laws applicable to you.
NOTICES
CitJo may post notices within the App or send You notices at Your registered e-mail address or telephone number. You will have been deemed to receive such notices within 3 (three) days of Us sending the notice. Your continued use of the App on expiry of such 3 (three) days shall constitute Your receipt and acceptance of the notices sent to You.
DISCLAIMER
The contents provided through the App may include technical inaccuracies or typographical errors. CitJo may make changes or improvements to the App at any time. The contents or any information available on the App is provided "as is" and "as available" and without warranties of any kind either expressed or implied, to the fullest extent permissible pursuant to applicable law.
CitJo does not warrant that the functions contained in the contents will be uninterrupted or error-free, that defects will be corrected, or the servers that make them available, are free of viruses or other harmful components. CitJo makes no commitment to update the materials on the interface. The above exclusion may not apply to You, to the extent that applicable law may not allow the exclusion of implied warranties.
CitJo shall not be liable for any misuse or data theft as a consequence of Your use of the App.
Your correspondence or business dealings with, or participation in promotions of, Sponsored Content or activity providers found on or through the App, including payment and delivery of related products or services, and any other terms, conditions, warranties, or representations associated with such dealings, are solely between You and such provider of Sponsored Content.
We will not be responsible nor liable for any loss or damage of any sort incurred as the result of any such dealings or as the result of the presence of such Sponsored Content on the App.

''',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall),
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
      ),
    );
  }
}
