import 'package:coworkers/config/app_color.dart';
import 'package:coworkers/controllers/list_worker_controller.dart';
import 'package:coworkers/widgets/header_worker.dart';
import 'package:coworkers/widgets/section_title.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListWorkerPage extends StatefulWidget {
  const ListWorkerPage({super.key, required this.category});
  final String category;

  @override
  State<ListWorkerPage> createState() => _ListWorkerPageState();
}

class _ListWorkerPageState extends State<ListWorkerPage> {
  final listWorkerController = Get.put(ListWorkerController());

  @override
  void initState() {
    listWorkerController.fetchAvailable(widget.category);
    super.initState();
  }

  @override
  void dispose() {
    listWorkerController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          SizedBox(
            height: 172,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: AppColor.bgHeader,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(80),
                      )),
                ),
                Transform.translate(
                  offset: const Offset(0, 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: HeaderWorker(
                          title: widget.category,
                          subtitle: '13,492 workers',
                          iconLeft: 'assets/ic_back.png',
                          functionLeft: () => Navigator.pop(context),
                          iconRight: 'assets/ic_filter.png',
                          functionRight: () => {}
                        ),
                      ),
                      searchBox(),
                    ],
                  ),
                )
              ],
            ),
          ),
          DView.height(50),
          topRatedCategory(),
        ],
      ),
    );
  }

  Widget searchBox() {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: const Color(0xffE5E7EC).withOpacity(0.5),
            blurRadius: 30,
            offset: const Offset(0, 6)
          )
        ]
      ),

      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.only(left: 20, right: 8),

      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by name',
                hintStyle: TextStyle(
                  color: Color(0xffA7A8B3),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(0),
                isDense: true
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const ImageIcon(AssetImage('assets/ic_search.png')),
          )
        ],
      ),
    );
  }

    Widget topRatedCategory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          text: 'Top Rated ${widget.category}', autoPadding: true,
        ),
        DView.height(),
        SizedBox(
          height: 120,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: listWorkerController.topRated.length,
            itemBuilder: (context, index) {
              Map worker = listWorkerController.topRated[index];
              return Container(
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xffEAEAEA)),
                ),
                margin: EdgeInsets.only(
                  left: index == 0 ? 20 : 8,
                  right: index == listWorkerController.topRated.length - 1 ? 20 : 8,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      worker['image'],
                      width: 46,
                      height: 46,
                    ),
                    DView.height(6),
                    Text(
                      worker['name'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                      ),
                    ),
                    DView.height(4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/ic_star_small.png',
                          height: 16,
                          width: 16,
                        ),
                        DView.width(2),
                        Text(
                          '${worker['rate']}',
                          style: const TextStyle(
                            color: Colors.black
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
