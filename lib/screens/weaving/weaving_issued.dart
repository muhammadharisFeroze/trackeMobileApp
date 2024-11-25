import 'package:flutter/material.dart';

import 'weaving_data_response_model.dart';

class NewWeavingIssueAndReceivedView extends StatelessWidget {
  final List<WeaverIssueReceived> weaverIssueReceived; 

  const NewWeavingIssueAndReceivedView({super.key, required this.weaverIssueReceived});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Weaving Issued & Received'),
        ),
        body: CustomScrollView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              var item = weaverIssueReceived[index]; // Access list item
                              return Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.grey),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Quality Code",
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  ),
                                                  Text(item.qualityCode ?? ""),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  const Text(
                                                    "PO No.",
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  ),
                                                  Text(item.poNo.toString() ?? ""),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 15),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "PO Date",
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  ),
                                                  Text(item.poDate.toString() ?? ""),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  const Text(
                                                    "PO Time",
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  ),
                                                  Text(item.poTime ?? ""),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 15),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "PO Issued Qty",
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  ),
                                                  Text(item.poIssueQty.toString() ?? ""),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  const Text(
                                                    "PO Received Qty",
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  ),
                                                  Text(item.poReceivedQty.toString() ?? ""),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 15),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Last Received Date",
                                              style: TextStyle(fontWeight: FontWeight.bold),
                                            ),
                                            Text(item.poLastReceivingDate.toString() ?? ""),
                                          ],
                                        ),
                                      ]));
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return const SizedBox(height: 10);
                            },
                            itemCount: weaverIssueReceived.length), // List length
                      ]))),
            ]));
  }
}
