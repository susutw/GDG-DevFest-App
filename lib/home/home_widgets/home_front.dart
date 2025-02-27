import 'package:flutter/material.dart';
import 'package:flutter_devfest/agenda/agenda_page.dart';
import 'package:flutter_devfest/config/devfest_event.dart';
import 'package:flutter_devfest/config/index.dart';
import 'package:flutter_devfest/faq/faq_page.dart';
import 'package:flutter_devfest/map/map_page.dart';
import 'package:flutter_devfest/speakers/speaker_page.dart';
import 'package:flutter_devfest/sponsors/sponsor_page.dart';
import 'package:flutter_devfest/team/team_page.dart';
import 'package:flutter_devfest/universal/image_card.dart';
import 'package:flutter_devfest/utils/app_localizations.dart';
import 'package:flutter_devfest/utils/devfest.dart';
import 'package:flutter_devfest/utils/tools.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeFront extends StatelessWidget {
  DevFestEvent get _devFestEvent => ConfigBloc().devFestEvent;

  List<Widget> devFestTexts(context) => [
        Text(
          _devFestEvent.welcomeText,
          style: Theme.of(context).textTheme.headline,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          _devFestEvent.descText,
          style: Theme.of(context).textTheme.caption,
          textAlign: TextAlign.center,
        ),
      ];

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget actions(context) => Wrap(
        alignment: WrapAlignment.center,
        spacing: 10.0,
        children: <Widget>[
          RaisedButton(
            child: Text(AppLocalizations.of(context).agenda),
            shape: StadiumBorder(),
            color: Colors.red,
            colorBrightness: Brightness.dark,
            onPressed: () => Navigator.pushNamed(context, AgendaPage.routeName),
          ),
          RaisedButton(
            child: Text(AppLocalizations.of(context).speakers),
            shape: StadiumBorder(),
            color: Colors.green,
            colorBrightness: Brightness.dark,
            onPressed: () =>
                Navigator.pushNamed(context, SpeakerPage.routeName),
          ),
          RaisedButton(
            child: Text(AppLocalizations.of(context).sponsor),
            shape: StadiumBorder(),
            color: Colors.orange,
            colorBrightness: Brightness.dark,
            onPressed: () =>
                Navigator.pushNamed(context, SponsorPage.routeName),
          ),
          RaisedButton(
            child: Text(AppLocalizations.of(context).team),
            shape: StadiumBorder(),
            color: Colors.purple,
            colorBrightness: Brightness.dark,
            onPressed: () => Navigator.pushNamed(context, TeamPage.routeName),
          ),
          RaisedButton(
            child: Text(AppLocalizations.of(context).faq),
            shape: StadiumBorder(),
            color: Colors.brown,
            colorBrightness: Brightness.dark,
            onPressed: () => Navigator.pushNamed(context, FaqPage.routeName),
          ),
          RaisedButton(
            child: Text(AppLocalizations.of(context).map),
            shape: StadiumBorder(),
            color: Colors.blue,
            colorBrightness: Brightness.dark,
            onPressed: () => Navigator.pushNamed(context, MapPage.routeName),
          ),
        ],
      );

  Widget newActions(context) => Wrap(
        alignment: WrapAlignment.center,
        spacing: 20.0,
        runSpacing: 20.0,
        children: <Widget>[
          ActionCard(
            icon: Icons.schedule,
            color: Colors.red,
            title: AppLocalizations.of(context).agenda,
            onPressed: () => Navigator.pushNamed(context, AgendaPage.routeName),
          ),
          ActionCard(
            icon: Icons.person,
            color: Colors.green,
            title: AppLocalizations.of(context).speakers,
            onPressed: () =>
                Navigator.pushNamed(context, SpeakerPage.routeName),
          ),
          ActionCard(
            icon: Icons.people,
            color: Colors.amber,
            title: AppLocalizations.of(context).team,
            onPressed: () => Navigator.pushNamed(context, TeamPage.routeName),
          ),
          ActionCard(
            icon: Icons.attach_money,
            color: Colors.purple,
            title: AppLocalizations.of(context).sponsor,
            onPressed: () =>
                Navigator.pushNamed(context, SponsorPage.routeName),
          ),
          ActionCard(
            icon: Icons.question_answer,
            color: Colors.brown,
            title: AppLocalizations.of(context).faq,
            onPressed: () => Navigator.pushNamed(context, FaqPage.routeName),
          ),
          ActionCard(
            icon: Icons.map,
            color: Colors.blue,
            title: AppLocalizations.of(context).map,
            onPressed: () => Navigator.pushNamed(context, MapPage.routeName),
          )
        ],
      );

  Widget socialActions(context) => FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            if (_devFestEvent.links.facebook != null &&
                _devFestEvent.links.facebook.isNotEmpty)
              IconButton(
                icon: Icon(FontAwesomeIcons.facebookF),
                onPressed: () async {
                  await _launchURL(_devFestEvent.links.facebook);
                },
              ),
            if (_devFestEvent.links.twitter != null &&
                _devFestEvent.links.twitter.isNotEmpty)
              IconButton(
                icon: Icon(FontAwesomeIcons.twitter),
                onPressed: () async {
                  await _launchURL(_devFestEvent.links.twitter);
                },
              ),
            if (_devFestEvent.links.linkedinIn != null &&
                _devFestEvent.links.linkedinIn.isNotEmpty)
              IconButton(
                icon: Icon(FontAwesomeIcons.linkedinIn),
                onPressed: () async {
                  _launchURL(_devFestEvent.links.linkedinIn);
                },
              ),
            if (_devFestEvent.links.youtube != null &&
                _devFestEvent.links.youtube.isNotEmpty)
              IconButton(
                icon: Icon(FontAwesomeIcons.youtube),
                onPressed: () async {
                  await _launchURL(_devFestEvent.links.youtube);
                },
              ),
            if (_devFestEvent.links.meetup != null &&
                _devFestEvent.links.meetup.isNotEmpty)
              IconButton(
                icon: Icon(FontAwesomeIcons.meetup),
                onPressed: () async {
                  await _launchURL(_devFestEvent.links.meetup);
                },
              ),
            if (_devFestEvent.links.emailUrl != null &&
                _devFestEvent.links.emailUrl.isNotEmpty)
              IconButton(
                icon: Icon(FontAwesomeIcons.envelope),
                onPressed: () async {
                  var emailUrl = _devFestEvent.links.emailUrl;
                  var out = Uri.encodeFull(emailUrl);
                  await _launchURL(out);
                },
              ),
            if (_devFestEvent.links.telegram != null &&
                _devFestEvent.links.telegram.isNotEmpty)
              IconButton(
                icon: Icon(FontAwesomeIcons.telegram),
                onPressed: () async {
                  var telegramUrl = _devFestEvent.links.telegram;
                  var out = Uri.encodeFull(telegramUrl);
                  await _launchURL(out);
                },
              ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ImageCard(
              img: ConfigBloc().darkModeOn
                  ? Devfest.banner_dark
                  : Devfest.banner_light,
            ),
            SizedBox(
              height: 20,
            ),
            ...devFestTexts(context),
            SizedBox(
              height: 20,
            ),
            newActions(context),
            SizedBox(
              height: 20,
            ),
            socialActions(context),
            SizedBox(
              height: 20,
            ),
            Text(
              Devfest.app_version,
              style: Theme.of(context).textTheme.caption.copyWith(fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final String title;
  final Color color;

  const ActionCard({Key key, this.onPressed, this.icon, this.title, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onPressed,
      child: Ink(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
          color: ConfigBloc().darkModeOn
              ? Tools.hexToColor("#1f2124")
              : Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: !ConfigBloc().darkModeOn
              ? [
                  BoxShadow(
                    color: Colors.grey[200],
                    blurRadius: 10,
                    spreadRadius: 5,
                  )
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: color,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.title.copyWith(
                    fontSize: 12,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
