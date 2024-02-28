
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

Future<dynamic> MyIconSelector(BuildContext context, List<dynamic> myIcons, RxString selectedIcon) {
  return Get.defaultDialog(
                      buttonColor: Theme.of(context).colorScheme.primary,
                      backgroundColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      title: "Select Icon",
                      content: Container(
                        height: 300,
                        width: 300,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: myIcons.length,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              print(myIcons[index]);
                              selectedIcon.value = myIcons[index];
                              Get.back();
                            },
                            child: Obx(
                              () => Container(
                                padding: EdgeInsets.all(20),
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .background,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color:
                                        selectedIcon.value == myIcons[index]
                                            ? Theme.of(context)
                                                .colorScheme
                                                .primary
                                            : Theme.of(context)
                                                .colorScheme
                                                .background,
                                    width: 3,
                                  ),
                                ),
                                child: SvgPicture.asset(
                                  myIcons[index],
                                  width: 50,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
}
