import 'package:contactbook/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:contactbook/contact_details_view.dart';
import 'package:grouped_list/grouped_list.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  final List<Map<String, String>> data = [
    {
      "name": "Abena Charity",
      "phone": "+233 277 77 6802",
      "email": "abenacharity@gmail.com",
      "country": "Ghana",
      "region": "Accra",
      "picture": "assets/person_1.jpeg"
    },
    {
      "name": "Belinda Bel",
      "phone": "0206757250",
      "email": "belindabel@gmailcom",
      "country": "Ghana",
      "region": "takoradi",
      "picture": "assets/person_2.jpeg"
    },
    {
      "name": "Appiah Jude",
      "phone": "0206757250",
      "email": "appaiahjude@gmail.com",
      "country": "Ghana",
      "region": "Greater Accra",
      "picture": "assets/person_3.jpg"
    },
    {
      "name": "Appiah Joseph",
      "phone": "0206757250",
      "email": "appiahjoseph@gmail.com",
      "country": "Ghana",
      "region": "Accra",
      "picture": "assets/person_4.jpg"
    },
    {
      "name": "B Evelyn Mensah",
      "phone": "0206727250",
      "email": "evelynmensah@gmail.com",
      "country": "Ghana",
      "region": "Takoradi",
      "picture": "assets/person_5.jpg"
    },
    {
      "name": "James Ansah",
      "phone": "0206757250",
      "email": "jamesansah@gmail.com",
      "country": "Ghana",
      "region": "Elminat",
      "picture": "assets/person_6.jpg"
    },
    {
      "name": "Ivy Boateng",
      "phone": "0206757250",
      "email": "ivyboateng@gmail.com",
      "country": "Ghana",
      "region": "Elmina",
      "picture": "assets/person_7.jpg"
    },
    {
      "name": "Eric Fiifi Ps",
      "phone": "0206757250",
      "email": "ericfiifi@gmail.com",
      "country": "Ghana",
      "region": "Accra",
      "picture": "assets/person_8.jpg"
    },
    {
      "name": "Andrews Marvin Asare Ps",
      "phone": "0206757250",
      "email": "andrewsasare@gmail.com",
      "country": "Ghana",
      "region": "Elmina",
      "picture": "assets/person_9.jpg"
    },
    {
      "name": "Edna Mensah Mrs",
      "phone": "0206757250",
      "email": "ednamensah@gmail.com",
      "country": "Ghana",
      "region": "Eastern",
      "picture": "assets/person_10.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: false,
          title: const Text(
            'My Contacts',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Center(
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/Dennis.jpg'),
                ),
              ),
            )
          ],
          elevation: 0,
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    hintText: 'Search by name or number',
                    prefixIcon: const Icon(Icons.search)),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: ListView(
            controller: _scrollController,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Recent',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
              ListView.separated(
                  controller: _scrollController,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ContactDetailsView(
                            contact: Contact(
                              country: 'Ghana',
                              email: 'belindabel@gmail.com',
                              name: 'Belinda Bel',
                              phone: '+233 20 67 57 250',
                              region: 'Takoradi',
                            ),
                          );
                        }));
                      },
                      leading: const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/person_2.jpeg'),
                      ),
                      title: const Text(
                        'Belinda Bel',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: const Text('+233 20 67 57 250'),
                      trailing: const IconButton(
                          onPressed: null, icon: Icon(Icons.more_horiz)),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      indent: 25,
                      thickness: 2,
                    );
                  },
                  itemCount: 5),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Contacts',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
              GroupedListView<Map<String, String>, String>(
                shrinkWrap: true,
                elements: data,
                groupBy: (element) =>
                    element['name'].toString().substring(0, 1),
                groupSeparatorBuilder: (String groupByValue) => SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      groupByValue.substring(0, 1),
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                ),
                itemBuilder: (context, Map<String, String> element) {
                  Contact contact = Contact.fromJson(element);
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ContactDetailsView(
                              contact: contact,
                            );
                          }));
                        },
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage('${element['picture']}'),
                        ),
                        title: Text(
                          '${element['name']}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text('${element['phone']}'),
                        trailing: const IconButton(
                            onPressed: null, icon: Icon(Icons.more_horiz)),
                      ),
                      const Divider(
                        indent: 25,
                        thickness: 2,
                      )
                    ],
                  );
                },
                itemComparator: (item1, item2) =>
                    item1['name']!.compareTo(item2['name']!), // optional
                useStickyGroupSeparators: true, // optional
                floatingHeader: true, // optional
                order: GroupedListOrder.ASC, // optional
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff1A4ADA),
          onPressed: () {},
          child: const Icon(Icons.add),
        ));
  }
}
