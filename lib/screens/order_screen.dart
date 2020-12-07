import 'package:flutter/material.dart';
import 'components/my_button.dart';


class OrderScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: Colors.white70,
			body: Container(
				child: Form(
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.center,
						children: <Widget>[
							Expanded(
								child: Center(
									child: TextFormField(
										key: Key("service"),
										decoration: InputDecoration(
											hintText: "Услуга",
										),
										style: TextStyle(fontSize: 20),
									)
								),
							),
							Expanded(
								flex: 2,
								child: Center(
									child: Column(
										mainAxisAlignment: MainAxisAlignment.center,
										children: <Widget>[
											TextFormField(
												key: Key("street_num"),
												decoration: InputDecoration(
													hintText: "Улица",
												),
											),
											TextFormField(
												key: Key("home_num"),
												decoration: InputDecoration(
													hintText: "Дом",
												),
											),
											TextFormField(
												key: Key("flat_num"),
												decoration: InputDecoration(
													hintText: "Квартира",
												),
											),
										],
									),
								),
							),
							Expanded(
								flex: 2,
								child: Center(
									child: Column(
										mainAxisAlignment: MainAxisAlignment.spaceEvenly,
										children: <Widget>[
											MyButton(
												btnText: "Заказать услугу",
												btnPressFunc: this.btnPress,
												btnTheme: MyButtonTheme.primary,
											),
											MyButton(
												btnText: "Заказать звонок",
												btnPressFunc: () {
													Navigator.pushNamed(context, '/sos');
												},
												btnTheme: MyButtonTheme.secondary,
											),
										],
									),
								),
							),
						]
					),
				),
			),
		);
	}

	btnPress() {
		print("ButtonPress");
	}
}