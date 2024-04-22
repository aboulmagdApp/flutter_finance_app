import 'package:finance_app/utils.dart';
import 'package:finance_app/widgets/chart.dart';
import 'package:flutter/material.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  int indexcolor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Statistics',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(4, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            indexcolor = index;
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 80,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: indexcolor == index
                                  ? const Color.fromARGB(255, 47, 125, 121)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            Utils.timeUnits[index],
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: indexcolor == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Expences',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Icon(
                              Icons.arrow_downward_sharp,
                              color: Colors.grey,
                            ),
                          ]),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Chart(),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Spending',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Icon(
                      Icons.swap_vert,
                      size: 25,
                      color: Colors.grey,
                    )
                  ],
                ),
              )
            ]),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              return ListTile(
                leading: Image.asset(
                  'images/${Utils.geter()[index].image!}',
                  height: 40,
                ),
                title: Text(
                  Utils.geter()[index].name!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
                subtitle: Text(
                  Utils.geter()[index].time!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Text(
                  Utils.geter()[index].fee!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red),
                ),
              );
            },
            childCount: Utils.geter().length,
          ))
        ],
      ),
    ));
  }
}
