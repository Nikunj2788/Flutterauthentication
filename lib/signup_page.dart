import 'package:firebaseapp/auth_controller.dart';
import 'package:flutter/material.dart';

class Signupage extends StatelessWidget {
  const Signupage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
var emailController = TextEditingController();
var passwordController = TextEditingController();
    List images=[
      "g.png",
      "t.png",
      "f.png"

    ];
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(

        body: Column(
          children: [
            Container(
              width: w,
              height: h*0.3,
              decoration:  BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "img/signup.png"
                      ),
                      fit: BoxFit.cover
                  )
              ),
              child: Column(
                children: [
                  SizedBox(height: h*0.16,),
                  CircleAvatar(
                    backgroundColor: Colors.white70,
                    radius: 60,
                    backgroundImage: AssetImage(
                      "img/profile1.png"
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20,right: 20),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 70,),

                   Container(
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(30),
                       boxShadow:[
                         BoxShadow(
                           blurRadius: 10,
                           spreadRadius: 7,
                           offset: Offset(1,1),
                           color: Colors.grey.withOpacity(0.2)
                         )
                       ]
                     ),
                     child: TextField(
                       controller: emailController,
                       decoration: InputDecoration(
                         hintText: "Enter Your Email",
                         prefixIcon: Icon(Icons.email,color: Colors.deepOrangeAccent,),
                         focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(30),
                           borderSide: BorderSide(
                             color: Colors.white,
                             width: 1.0
                             
                           )
                         ),
                         enabledBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(30),
                           borderSide: BorderSide(
                             color: Colors.white,
                             width: 1.0
                           )
                         ),
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(30)
                         )
                       ),
                     ),
                   ),
                  SizedBox(height: 70,),

                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow:[
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: Offset(1,1),
                              color: Colors.grey.withOpacity(0.2)
                          )
                        ]
                    ),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Your password",
                          prefixIcon: Icon(Icons.password_outlined,color: Colors.deepOrangeAccent,),

                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.0

                              )
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.0
                              )
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: 70,),

                  GestureDetector(
                    onTap: (){
                      AuthController.instance.register(emailController.text.trim(), passwordController.text.trim());
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 80,right: 60),

                      width: w*0.5,
                      height: h*0.08,
                      decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                              image: AssetImage(
                                  "img/loginbtn.png"
                              ),
                              fit: BoxFit.cover
                          )

                      ),
                      child:  Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 36,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 40),
                  RichText(text: TextSpan(
                    text: "Sign up using one of the following methods",
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 16
                      ),

                  )),
                  Wrap(

                    children: List<Widget>.generate(3, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey[500],
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage(
                              "img/"+images[index]
                            ),

                          ),
                        ),
                      );
                    }),


                  )
                ],
              ),
            )
]
    )
    );
  }
}
