# Container Design - Usage Examples

## Basic Usage

### Example 1: Standard Container (ПБК Type)
```openscad
// Basic container with default settings
use <container_design_improved.scad>

container_length = 7000;
container_width = 3000;
container_height = 2500;
container_type = "ПБК";
sandwich_thickness = 100;

simplified_container();
```

### Example 2: Compact Container (УБК Type)
```openscad
use <container_design_improved.scad>

container_length = 5000;
container_width = 2500;
container_height = 2200;
container_type = "УБК";
sandwich_thickness = 80;
temperature_mode = -45;

simplified_container();
```

### Example 3: Arctic Container (Low Temperature)
```openscad
use <container_design_improved.scad>

container_length = 6000;
container_width = 2800;
container_height = 2400;
container_type = "ПБК";
sandwich_thickness = 150;  // Thicker insulation
temperature_mode = -60;     // Arctic conditions

simplified_container();
```

## Database Usage Examples

### Example 4: Query Profile Parameters
```openscad
use <container_design_improved.scad>

// Get specific profile parameters
db = create_profile_database();

channel_height = get_profile_param("Швеллер", "12П", "h", db);
channel_width = get_profile_param("Швеллер", "12П", "b", db);
channel_mass = get_profile_param("Швеллер", "12П", "mass", db);

echo("Channel 12П dimensions:");
echo("  Height:", channel_height, "mm");
echo("  Width:", channel_width, "mm");
echo("  Mass:", channel_mass, "kg/m");

// Get angle profile parameters
angle_size = get_profile_param("Уголок", "63x63x6", "h", db);
echo("Angle 63x63x6 size:", angle_size, "mm");
```

### Example 5: Calculate Material Requirements
```openscad
use <container_design_improved.scad>

// Calculate total length of beams needed
L = 7000;  // Container length
W = 3000;  // Container width
H = 2500;  // Container height

// Base frame
base_perimeter = 2 * L + 2 * W;

// Vertical posts (4 corners + intermediates)
num_posts = 4 + floor((L - 500) / 2500) * 2;
total_post_length = num_posts * H;

// Top frame
top_perimeter = 2 * L + 2 * W;

echo("Material requirements:");
echo("  Base frame:", base_perimeter, "mm of channel");
echo("  Vertical posts:", total_post_length, "mm total");
echo("  Top frame:", top_perimeter, "mm of angle/tube");
```

## Component Testing Examples

### Example 6: Test Individual Profile
```openscad
use <container_design_improved.scad>

// Display a single profile for inspection
profile_detail(
    material = "Швеллер",
    size = "12П",
    length = 1000,
    position = [0, 0, 0],
    rotation = [0, 0, 0],
    assembly = "Test",
    component = "Test Beam"
);
```

### Example 7: Compare Profile Sizes
```openscad
use <container_design_improved.scad>

// Display different channel sizes side by side
sizes = ["10П", "12П", "14П", "16П"];

for (i = [0 : len(sizes) - 1]) {
    translate([i * 200, 0, 0])
    profile_detail(
        material = "Швеллер",
        size = sizes[i],
        length = 1000,
        assembly = "Comparison",
        component = str("Channel ", sizes[i])
    );
}
```

### Example 8: Test Coordinate Generation
```openscad
use <container_design_improved.scad>

// Visualize beam placement coordinates
L = 7000;
step = 1250;
coords = generate_coords(L, step);

echo("Generated coordinates:", coords);
echo("Number of beams:", len(coords));

// Visualize placement
for (x = coords) {
    translate([x, 0, 0])
    color("red")
    cylinder(r = 10, h = 100);
}
```

## Steel Type Selection Examples

### Example 9: Steel Type for Different Temperatures
```openscad
use <container_design_improved.scad>

temperatures = [-60, -50, -40, -30, -20, 0];

echo("Steel selection by temperature:");
for (temp = temperatures) {
    steel = select_steel_type(temp);
    echo(str("  ", temp, "°C: ", steel));
}
```

## Beam Specification Examples

### Example 10: Get Beam Specs for Container Type
```openscad
use <container_design_improved.scad>

container_types = ["ПБК", "УБК"];
thicknesses = [50, 80, 100];

echo("Beam specifications:");
for (type = container_types) {
    echo(str("Container type: ", type));
    for (thick = thicknesses) {
        spec = get_beam_spec(
            "Балка продольная левая верхней рамы",
            type,
            thick
        );
        echo(str("  Thickness ", thick, "mm: ",
                 spec[0], " ", spec[1]));
    }
}
```

## Color Scheme Examples

### Example 11: Visualize Profile Colors
```openscad
use <container_design_improved.scad>

profile_types = ["Швеллер", "Уголок", "Труба", "Полоса"];

for (i = [0 : len(profile_types) - 1]) {
    translate([i * 150, 0, 0]) {
        color(get_profile_color(profile_types[i]))
        cube([100, 100, 50], center = true);

        // Label
        translate([50, 0, -50])
        text(profile_types[i], size = 10, halign = "center");
    }
}
```

## Configuration Variations

### Example 12: Multiple Containers in One Scene
```openscad
use <container_design_improved.scad>

// Small container
translate([0, 0, 0]) {
    container_length = 5000;
    container_width = 2500;
    container_height = 2200;
    simplified_container();
}

// Medium container
translate([6000, 0, 0]) {
    container_length = 7000;
    container_width = 3000;
    container_height = 2500;
    simplified_container();
}

// Large container (would need to be defined if supported)
translate([14000, 0, 0]) {
    container_length = 9000;
    container_width = 3000;
    container_height = 2800;
    simplified_container();
}
```

## Advanced Usage

### Example 13: Custom Configuration with All Options
```openscad
use <container_design_improved.scad>

// Container dimensions
container_length = 7000;
container_width = 3000;
container_height = 2500;

// Specifications
container_type = "ПБК";
sandwich_thickness = 100;
temperature_mode = -45;

// Base frame
sheet_width = 1250;
main_beam_type = "14П";
long_beam_material = "Труба";
long_beam_step = 1200;

// Additional elements
show_drainage = true;
show_corner_brackets = true;
corner_bracket_size = 150;

// Door
door_height = 2100;
door_width = 1000;

// Cable entry
cable_entry_height = 350;
cable_entry_offset = 600;
cable_entry_count = 6;

// Roof
roof_rafter_profile = "50x25x2";
roof_ridge_height = 150;

// Visualization
transparency = 0.6;
$fn = 100;

simplified_container();
```

### Example 14: Export Container Data
```openscad
use <container_design_improved.scad>

// Calculate and export container specifications
L = container_length;
W = container_width;
H = container_height;

db = create_profile_database();
beam_spec = get_beam_spec(
    "Балка продольная левая верхней рамы",
    container_type,
    sandwich_thickness
);

volume = L * W * H / 1e9;  // m³
floor_area = L * W / 1e6;  // m²
wall_area = 2 * (L * H + W * H) / 1e6;  // m²

echo("=== Container Specification ===");
echo("Dimensions (LxWxH):", L, "x", W, "x", H, "mm");
echo("Internal volume:", volume, "m³");
echo("Floor area:", floor_area, "m²");
echo("Wall area:", wall_area, "m²");
echo("Container type:", container_type);
echo("Insulation thickness:", sandwich_thickness, "mm");
echo("Temperature rating:", temperature_mode, "°C");
echo("Steel type:", select_steel_type(temperature_mode));
echo("Main beam:", beam_spec[0], beam_spec[1]);
```

## Performance Testing

### Example 15: Rendering Performance Test
```openscad
use <container_design_improved.scad>

// Test different $fn values
fn_values = [20, 50, 100, 200];

echo("=== Performance Test ===");
for (fn = fn_values) {
    $fn = fn;
    echo(str("$fn = ", fn));
    // Time your renders manually
    simplified_container();
}
```

## Integration Examples

### Example 16: Multiple Container Layout (Site Plan)
```openscad
use <container_design_improved.scad>

// Site layout with multiple containers
spacing = 500;  // mm between containers

// Row 1
for (i = [0 : 2]) {
    translate([i * (7000 + spacing), 0, 0]) {
        container_length = 7000;
        container_width = 3000;
        container_height = 2500;
        simplified_container();
    }
}

// Row 2
for (i = [0 : 2]) {
    translate([i * (7000 + spacing), -(3000 + spacing), 0]) {
        container_length = 7000;
        container_width = 3000;
        container_height = 2500;
        simplified_container();
    }
}
```

## Validation Examples

### Example 17: Parameter Validation
```openscad
use <container_design_improved.scad>

// Valid configuration
container_length = 7000;
container_width = 3000;
container_height = 2500;

// Add validation
assert(container_length >= 3000 && container_length <= 9020,
       "Length must be 3000-9020mm");
assert(container_width >= 2000 && container_width <= 3000,
       "Width must be 2000-3000mm");
assert(container_height >= 1800,
       "Height must be >= 1800mm");

echo("Validation passed");
simplified_container();
```

## Utility Function Examples

### Example 18: Working with Coordinates
```openscad
use <container_design_improved.scad>

// Generate beam coordinates
L = 7000;
beam_step = 1250;

coords = generate_coords(L, beam_step, 200, 200);
echo("Beam positions:", coords);

// Generate post coordinates
post_coords = generate_post_coords(L);
echo("Post positions:", post_coords);

// Visualize
for (x = coords) {
    translate([x, 0, 0])
    color("blue")
    cylinder(r = 20, h = 50, center = true);
}

for (x = post_coords) {
    translate([x, 0, 100])
    color("red")
    cylinder(r = 30, h = 50, center = true);
}
```

---

## Tips for Using Examples

1. **Copy example code** into a new `.scad` file
2. **Adjust parameters** to your needs
3. **Use Preview mode** (F5) for fast iteration
4. **Use Render mode** (F6) for final output
5. **Export STL** for 3D printing or further processing

## Common Modifications

### Changing Size:
- Adjust `container_length`, `container_width`, `container_height`
- Ensure values are within valid ranges

### Changing Material:
- Modify `main_beam_type` for base frame
- Change `container_type` to switch between ПБК and УБК

### Changing Insulation:
- Adjust `sandwich_thickness` (50-150mm typical)
- Consider `temperature_mode` for material selection

### Visual Adjustments:
- Change `transparency` (0-1) for see-through panels
- Adjust `$fn` (20-200) for circle/curve quality
- Modify `visual_scale` if needed

---

**Note**: These examples use the simplified version. For full detailed rendering with doors, cable entries, roof trusses, etc., additional modules would need to be implemented based on the original code structure.
