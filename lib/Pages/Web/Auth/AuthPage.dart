import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_home/Pages/Mobile/Auth/Widgets/AuthPageBody.dart';
import 'package:smart_home/Pages/Mobile/Auth/Widgets/Heading.dart';
import 'package:smart_home/Pages/Mobile/Auth/Widgets/LoginForm.dart';
import 'package:smart_home/Pages/Mobile/Auth/Widgets/SignupForm.dart';

class WebAuthPage extends StatelessWidget {
  const WebAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isLogin = true.obs;
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 1.5,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Placeholder(
                          fallbackHeight: 200,
                          fallbackWidth: 200,
                        ),
                        SizedBox(height: 20),
                        Text("Home Automation")
                      ],
                    )),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        WelcomeHeading(),
                        SizedBox(height: 10),
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  isLogin.value = true;
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width / 9,
                                  child: Column(
                                    children: [
                                      Text(
                                        "Login",
                                        style: isLogin.value
                                            ? Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                            : Theme.of(context)
                                                .textTheme
                                                .labelLarge,
                                      ),
                                      SizedBox(height: 5),
                                      AnimatedContainer(
                                        duration: Duration(milliseconds: 200),
                                        width: isLogin.value ? 100 : 0,
                                        height: 3,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  isLogin.value = false;
                                },
                                child: SizedBox(
                                  // width: MediaQuery.sizeOf(context).width / 2.5,

                                  width: MediaQuery.sizeOf(context).width / 9,
                                  child: Column(
                                    children: [
                                      Text(
                                        "Signup",
                                        style: isLogin.value
                                            ? Theme.of(context)
                                                .textTheme
                                                .labelLarge
                                            : Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                      ),
                                      const SizedBox(height: 5),
                                      AnimatedContainer(
                                        duration: Duration(milliseconds: 200),
                                        width: isLogin.value ? 0 : 100,
                                        height: 3,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Obx(
                          () => isLogin.value
                              ? const LoginForm()
                              : const SignupForm(),
                        )
                      ],
                    )),
                  ],
                )),
          ],
        )
      ],
    ));
  }
}
