import 'package:flutter/material.dart';

class PortfolioItem extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String type;
  final Function()? onTap;
  const PortfolioItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.type,
    this.onTap,
  });

  @override
  State<PortfolioItem> createState() => _PortfolioItemState();
}

class _PortfolioItemState extends State<PortfolioItem> {
  bool _isFocussed = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isFocussed = true;
        });
      },
      onExit: ((event) {
        setState(() {
          _isFocussed = false;
        });
      }),
      child: InkWell(
        onTap: () {},
        child: Hero(
          tag: widget.imageUrl,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              boxShadow: kElevationToShadow[2],
              image: DecorationImage(
                colorFilter: _isFocussed
                    ? ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.darken)
                    : null,
                image: NetworkImage(widget.imageUrl),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                  height: _isFocussed ? 0 : 50,
                ),
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: _isFocussed ? Colors.white : Colors.transparent),
                ),
                Text(
                  widget.type,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: _isFocussed ? Colors.white : Colors.transparent),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
