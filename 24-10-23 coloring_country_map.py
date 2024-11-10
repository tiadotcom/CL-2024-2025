from z3 import *

def xor3(x, y, z):
    """Helper function to define the xor3 constraint for coloring."""
    return And(Or(x, y, z), AtMost(x, y, z, 1))

def add_country(s, country):
    """Add a country to the solver with three color choices."""
    colors = [Bool(f"{country}_1"), Bool(f"{country}_2"), Bool(f"{country}_3")]
    s.add(xor3(*colors))
    return colors

def add_border_constraints(s, c1_colors, c2_colors):
    """Add constraints that two countries sharing a border cannot have the same color."""
    for i in range(3):
        s.add(Not(And(c1_colors[i], c2_colors[i])))

def main():
    s = Solver()

    # Get the countries and their borders as input
    n = int(input("Enter the number of countries: "))
    countries = {}
    for _ in range(n):
        country_name = input("Enter country name: ")
        countries[country_name] = add_country(s, country_name)

    m = int(input("Enter the number of borders (pairs of neighboring countries): "))
    for _ in range(m):
        country1, country2 = input("Enter two countries that share a border (space-separated): ").split()
        if country1 in countries and country2 in countries:
            add_border_constraints(s, countries[country1], countries[country2])
        else:
            print(f"One or both of the countries '{country1}' and '{country2}' are not defined.")

    # Solve the constraints to check if 3 colors are enough
    if s.check() == sat:
        print("It is possible to color the map with 3 colors.")
        print("Here's a possible coloring:")
        model = s.model()
        for country, colors in countries.items():
            for i, color in enumerate(colors, 1):
                if model.evaluate(color):
                    print(f"{country} is colored with color {i}")
    else:
        print("It is not possible to color the map with 3 colors.")

if __name__ == "__main__":
    main()
