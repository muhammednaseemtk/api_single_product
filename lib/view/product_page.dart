import 'package:flutter/material.dart';
import 'package:single_product/model/product_model.dart';
import 'package:single_product/service/product_service.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductService service = ProductService();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Page',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<ProductModel?>(
        future: service.fetchProduct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('Not Found Data'));
          }
          final product = snapshot.data!;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      product.images?.join('') ?? '',
                      height: 290,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(product.title ?? ''),
                  SizedBox(height: 10),
                  Text(product.description ?? ''),
                  SizedBox(height: 10),
                  Text(product.category ?? ''),
                  SizedBox(height: 10),
                  Text('Price: ${product.price}'),
                  SizedBox(height: 10),
                  Text('Discount Percentage: ${product.discountPercentage}'),
                  SizedBox(height: 10),
                  Text('Rating: ${product.rating}'),
                  SizedBox(height: 10),
                  Text('Stock: ${product.stock}'),
                  SizedBox(height: 10),
                  Text(product.tags?.join(', ') ?? ''),
                  SizedBox(height: 10),
                  Text(product.brand ?? ''),
                  SizedBox(height: 10),
                  Text(product.sku ?? ''),
                  SizedBox(height: 10),
                  Text('Weight: ${product.weight}'),
                  SizedBox(height: 10),
                  Text('Size ${product.dimensions?.width} x ${product.dimensions?.height} x ${product.dimensions?.depth}'),
                  SizedBox(height: 10),
                  Text(product.warrantyInformation ?? ''),
                  SizedBox(height: 10),
                  Text(product.shippingInformation ?? ''),
                  SizedBox(height: 10),
                  Text(product.availabilityStatus ?? ''),
                  SizedBox(height: 10),
                  Text(
                    "Reviews",
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8,),
                    product.reviews != null && product.reviews!.isNotEmpty
                    ?ListView.builder(
                    shrinkWrap: true,physics: const NeverScrollableScrollPhysics(),
                    itemCount: product.reviews!.length,
                    itemBuilder: (context,index){
                      final review = product.reviews![index];
                      return Card(
                        child: ListTile(
                          title: Text(review.reviewerName?? ''),
                          subtitle: Text(review.comment?? ' '),
                          trailing: Text('${review.rating}⭐'),
                        ),
                      );
                    }
                    )
                    :const Text("No reviews available")
                ],    
              ),
            ),
          );
        },
      ),
    );
  }
}
