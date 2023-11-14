import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
// import '../showcasetimeline/showcase_timeline_tile.dart';

class HomeTimeline extends StatelessWidget {
  const HomeTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[100]),
      child: Transform.translate(
        offset: const Offset(0, -50),
        child: Container(
          decoration: BoxDecoration(color: Colors.grey[100]),
          padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
          child: FixedTimeline.tileBuilder(
            theme: TimelineTheme.of(context).copyWith(
              nodePosition: 0,
              connectorTheme: TimelineTheme.of(context)
                  .connectorTheme
                  .copyWith(thickness: 1.0, color: Colors.grey[400]),
              indicatorTheme: TimelineTheme.of(context).indicatorTheme.copyWith(
                    size: 10.0,
                    position: 0.5,
                  ),
            ),
            builder: TimelineTileBuilder.connectedFromStyle(
              firstConnectorStyle: ConnectorStyle.transparent,
              lastConnectorStyle: ConnectorStyle.transparent,
              connectorStyleBuilder: (context, index) =>
                  ConnectorStyle.solidLine,
              indicatorStyleBuilder: (context, index) =>
                  IndicatorStyle.outlined,
              indicatorPositionBuilder: (context, index) {
                return 0;
              },
              itemCount: 3,
              contentsAlign: ContentsAlign.basic,
              contentsBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(bottom: 30, left: 20),
                child: Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Aug",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 3),
                        Text(
                          "4",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.orange[900],
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.fastfood,
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Food & Drink",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      "Seafood in europe",
                                      style: TextStyle(color: Colors.grey[600]),
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            Divider(
                              height: 1,
                              color: Colors.grey[300],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.blue[900],
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Shopping",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      "Home Groceries",
                                      style: TextStyle(color: Colors.grey[600]),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
