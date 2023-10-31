#set page(paper: "us-letter")
#set text(font: "Inter", fallback: false)

#let g(x) = str(calc.round(x, digits: 1)) + " g"

#let substances = (
	("Butter", 226.796185),
	("Chocolate Chips", 170),
	("Cocoa Powder", 120),
	("Flour", 120),
	("Ghee", 176),
	("Milk", 227, "(incl. cream, buttermilk, yogurt)"),
	("Milk, Powdered", 112),
	("Oats", 89),
	("Oil, Vegetable", 198),
	("Sugar, Brown, Packed", 213),
	("Sugar, Brown, Unpacked", 145),
	("Sugar, White", 200),
	("Water", 236.59),
)

= Volume to Weight Reference

#table(
	columns: (auto,) * 5 + (1fr,),
	fill: (x, y) => if y == 0 { luma(235) } else { white },
	..("Substance", "1 cup", "1/2 cup", "1/3 cup", "1/4 cup", "Notes").map(x => [*#x;*]),
	..substances.map((t) => (t.at(0), g(t.at(1)), g(t.at(1) * 0.5), g(t.at(1) * (1 / 3)), g(t.at(1) * 0.25), t.at(2, default: ""))).flatten(),
)
