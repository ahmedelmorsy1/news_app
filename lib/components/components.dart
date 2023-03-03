import 'package:flutter/material.dart';

import 'constants.dart';

/*TODO:18 add api contents*/
/*TODO:18.7 add parameters into build articleitem to send into screens to get the data */
Widget buildArticleItem(article ,context) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(width: 120,height: 120,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                /*TODO:18.8 get the data for api */
                  image: NetworkImage('${article['urlToImage']}'),fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 20,),
          Expanded(
            child: Container(height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                //mainAxisSize: MainAxisSize.min, // doesn't work with mainaxisalignment
                children: [
                  /*TODO:18.8 get the data for api */
                  Expanded(
                    child: Text(' ${article['title']}',style: Theme.of(context).textTheme.headline6,
                      maxLines: 3,overflow: TextOverflow.ellipsis,),
                  ),
                  Text('${article['publishedAt']}',style: smallTex,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
/*TODO:18.1 add divider for the listviewseperated */
Widget myDivider() => Divider(
      height: 1,thickness: 1,
      indent: 0.0,endIndent: 1.0,
    );


/*TODO:21 for getting the screens*/
Widget articleBuilder(list) =>ListView.separated(
            physics: BouncingScrollPhysics(), //when scrolling it makes no color
            /*TODO:21.1 add list[index] which is the data we want to get */
            itemCount: 10,
            itemBuilder: (context,index) =>buildArticleItem(list[index],context),
            separatorBuilder: (context , index) =>myDivider(),
            );
      
