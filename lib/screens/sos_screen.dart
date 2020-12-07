import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'components/my_button.dart';


class SOSScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: Colors.white70,
			body: Form(
				child: Column(
					children: <Widget>[
						Expanded(
							child: Column(
								mainAxisAlignment: MainAxisAlignment.center,
								crossAxisAlignment: CrossAxisAlignment.center,
								children: <Widget>[
									Padding(
										padding: const EdgeInsets.symmetric(horizontal: 30),
										child: TextFormField(
											style: TextStyle(fontSize: 20),
										),
									),
									Text("Оставьте свой номер для"),
									Text("обратного вызова"),
									SizedBox(height: 30),
									MyButton(
										btnText: "Оставить",
										btnPressFunc: () {},
										btnTheme: MyButtonTheme.primary,
									)
								],
							),
						),
						Row(mainAxisAlignment: MainAxisAlignment.center, children: [
							Expanded(child: Divider(color: Colors.black)),
							Text("или", style: TextStyle(fontSize: 18),),
							Expanded(child: Divider(color: Colors.black)),
						]),
						Expanded(
							child: Column(
								mainAxisAlignment: MainAxisAlignment.center,
								children: <Widget>[
									Text('Позвоните нам', style: TextStyle(fontSize: 18)),
									Text(
										'+7(900)-999-99-99',
										style: TextStyle(
											fontSize: 18,
											fontWeight: FontWeight.bold
										)
									),
									SizedBox(height: 30),
									MyButton(
										btnText: "Позвонить",
										btnPressFunc: () {
											this._launchCaller();
										},
										btnTheme: MyButtonTheme.secondary,
									)
								],
							),
						),
					],
				),
			),
		);
	}

	void _launchCaller() async {
		const url = "tel://79009999999";
		if (await canLaunch(url))
			await launch(url);
		else
			throw 'Could not launch $url';
	}
}