import 'package:flutter/material.dart';

class SearchAppBar extends StatefulWidget {
  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();
  double _searchBarWidth = 200.0; // Largura inicial da barra de pesquisa

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: AnimatedCrossFade(
        duration: Duration(milliseconds: 300),
        firstChild: Text(
          "NeedFood",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        secondChild: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: _isSearching ? 400.0 : 200.0, // Largura dinâmica da barra de pesquisa
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {}); // Redesenha o widget para atualizar a visibilidade do ícone de limpar
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search...",
                  ),
                ),
              ),
              _searchController.text.isEmpty
                  ? Container()
                  : IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          _searchController.clear();
                        });
                      },
                    ),
            ],
          ),
        ),
        crossFadeState:
            _isSearching ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            setState(() {
              _isSearching = !_isSearching;
            });
          },
        ),
      ],
      floating: true,
      pinned: true,
      snap: false,
      backgroundColor: Colors.white70,
      elevation: 0,
    );
  }
}
