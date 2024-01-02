import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/controller/category_provider.dart';
import 'package:myapp/controller/wishlist_provider.dart.dart';
import 'package:myapp/helpers/helpers.dart';
import 'package:myapp/model/product_model.dart';
import 'package:myapp/services/auth_service.dart';
import 'package:myapp/views/details.dart';
import 'package:provider/provider.dart';

class CategoryListBuilder extends StatelessWidget {
  final CategoryProvider catPro;
   CategoryListBuilder({
    super.key,
    required this.catPro,
  });
  AuthService auth= AuthService();
  @override
  Widget build(BuildContext context) {
    final wishlistpro = Provider.of<Wishlist>(context);
    return CustomScrollView(
      slivers: [
        SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  ProductModel product = catPro.items[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(0.5),
                      child: GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(3, 4),
                                    blurRadius: 2.5,
                                    color: Colors.black.withOpacity(0.2)),
                              ],
                              color: Color.fromARGB(255, 29, 35, 46),
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(product.image!, scale: 7))),
                          child: Stack(
                            children: [
                              Positioned(
                                  left: 10,
                                  top: 10,
                                  child: Text(
                                    product.category!,
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white, fontSize: 10),
                                  )),
                              Positioned(
                                  right: 10,
                                  top: 10,
                                  child: InkWell(
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage('assets/add-to-favorites.png'))
                                      ),
                                    ),
                                    onTap: () {
                                      wishlistpro.addProductToWishlist(product, auth.auth.currentUser!.uid);
                                    },
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.title ?? 'No title',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      '${product.price}',
                                      style: GoogleFonts.montserrat(
                                          color: Color.fromARGB(255, 38, 184, 43),
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                  right: 10,
                                  bottom: 10,
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Colors.white.withOpacity(0.1),
                                    child: InkWell(
                                        onTap: () {},
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 13,
                                          color: Colors.white,
                                        )),
                                  ))
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsPage(
                            product: product,
                          )));
                        },
                      ),
                    ),
                  );
                },
                childCount: catPro.items.length,
              ),
            ),
      ],
    );
  }
}