// ============================================================================
// CONTAINER DESIGN MODULE - IMPROVED VERSION
// ============================================================================
// Description: Parametric container design system with steel profiles
// Author: Improved version
// Date: 2025-10-26
// ============================================================================

// ============================================================================
// CONFIGURATION PARAMETERS
// ============================================================================

/* [Main Container Dimensions] */
container_length = 7000;  // [3000:100:9020] Length of container (mm)
container_width = 3000;   // [2000:100:3000] Width of container (mm)
container_height = 2500;  // [1800:10:3000] Height of container (mm)

/* [Container Specification] */
container_type = "ПБК";              // ["ПБК", "УБК"] Container type
sandwich_thickness = 100;             // [50:10:150] Sandwich panel thickness (mm)
temperature_mode = -60;               // [-60:10:40] Minimum temperature (°C)

/* [Base Frame Parameters] */
sheet_width = 1250;                   // Width of sheet metal in base frame
main_beam_type = "12П";               // ["10П", "12П", "14П", "16П"] Main transverse beam type
long_beam_material = "Труба";         // ["Труба", "Швеллер"] Longitudinal beam material
long_beam_step = 1200;                // [400:100:2000] Longitudinal beam spacing (mm)

/* [Additional Elements] */
show_drainage = true;                 // Show drainage trough
show_corner_brackets = true;          // Show corner brackets
corner_bracket_size = 140;            // [100:10:200] Corner bracket size (mm)

/* [Door Parameters] */
door_height = 2000;                   // [1800:100:2400] Door height (mm)
door_width = 1007;                    // [800:100:1200] Door width (mm)

/* [Cable Entry Parameters] */
cable_entry_height = 300;             // [200:50:500] Cable entry height (mm)
cable_entry_offset = 500;             // [300:100:1000] Cable entry offset (mm)
cable_entry_count = 5;                // [1:1:10] Number of cable entries
cable_entry_profile = "50x50x3";      // Profile type for cable entry

/* [Filling Neck Parameters] */
filling_neck_height = 1500;           // [1000:100:2000] Filling neck height (mm)
filling_neck_offset = 500;            // [300:100:1000] Filling neck offset (mm)

/* [Roof Parameters] */
roof_rafter_profile = "40x20x2";      // Rafter profile type
roof_ridge_height = 100;              // [0:50:200] Roof ridge height (mm)

/* [Ventilation Grilles] */
grille_anr1_height = 1000;            // [500:100:1500] ANR1 grille height (mm)
grille_anr1_width = 1000;             // [500:100:1500] ANR1 grille width (mm)
grille_anr2_height = 1000;            // [500:100:1500] ANR2 grille height (mm)
grille_anr2_width = 1000;             // [500:100:1500] ANR2 grille width (mm)

/* [Visualization] */
transparency = 0.5;                   // [0:0.1:1] Component transparency
element_config = 1;                   // [1:1:10] Element arrangement configuration

/* [System Parameters] */
$fn = 50;                             // Circle resolution
visual_scale = 1.0;                   // [0.5:0.1:2.0] Visual scale factor
standard_panel_width = 1195;          // Standard sandwich panel width (mm)

// ============================================================================
// MATERIAL DATABASE - STEEL PROFILES
// ============================================================================
// Format: [Name, Standard, Size, Subtype, h, b, s, t, r, R, A, Mass]

function create_profile_database() = [
    // Channels (Швеллер)
    ["Швеллер", "ГОСТ 8240-97", "12Л", "легкой серии с параллельными гранями полок", 120, 30, 3, 4.8, 7.6, 7, 6.39, 5.02],
    ["Швеллер", "ГОСТ 8240-97", "16Л", "легкой серии с параллельными гранями полок", 160, 35, 3.4, 5.3, 8.3, 8, 9.04, 7.1],
    ["Швеллер", "ГОСТ 8240-89", "10П", "с параллельными гранями полок", 100, 46, 4.5, 7.6, 15.3, 7, 10.9, 8.59],
    ["Швеллер", "ГОСТ 8240-89", "12П", "с параллельными гранями полок", 120, 52, 4.8, 7.8, 16.6, 7.5, 13.3, 10.4],
    ["Швеллер", "ГОСТ 8240-89", "14П", "с параллельными гранями полок", 140, 58, 4.9, 8.1, 18.2, 8, 15.6, 12.3],
    ["Швеллер", "ГОСТ 8240-89", "16П", "с параллельными гранями полок", 160, 64, 5, 8.4, 19.7, 8.5, 18.1, 14.2],

    // Square Tubes (Труба квадратная)
    ["Труба", "ГОСТ Р 54157-2010", "40x40x3", "квадратная", 40, 40, 3, 6, 4.21, 3.3, 9.32, 4.66],
    ["Труба", "ГОСТ Р 54157-2010", "50x50x3", "квадратная", 50, 50, 3, 6, 5.41, 4.25, 19.47, 7.79],
    ["Труба", "ГОСТ 30245-2003", "80x80x6", "квадратная", 80, 80, 6, 12, 9.38, 7.36, 56.97, 9.8],
    ["Труба", "ГОСТ 30245-2003", "100x100x5", "квадратная", 100, 100, 5, 10, 18.36, 14.41, 270.9, 54.19],
    ["Труба", "ГОСТ 30245-2003", "120x120x5", "квадратная", 120, 120, 6, 12, 26.43, 20.75, 561.8, 93.64],
    ["Труба", "ГОСТ 30245-2003", "140x140x7", "квадратная", 140, 140, 7, 17.5, 35.56, 27.91, 1020, 145.7],
    ["Труба", "ГОСТ 30245-2003", "160x160x6", "квадратная", 160, 160, 6, 12, 36.03, 28.29, 1405, 175.6],

    // Rectangular Tubes (Труба прямоугольная)
    ["Труба", "ГОСТ Р 54157-2010", "40x20x2", "прямоугольная", 40, 20, 2, 3, 2.17, 1.704, 4.18, 2.09],
    ["Труба", "ГОСТ 30245-2003", "80x40x3", "прямоугольная", 80, 40, 3, 6, 6.61, 5.19, 52.24, 13.06],
    ["Труба", "ГОСТ Р 54157-2010", "80x40x3", "прямоугольная", 80, 40, 3, 6, 6.61, 5.195, 52.25, 13.06],
    ["Труба", "ГОСТ 30245-2003", "150x100x5", "прямоугольная", 150, 100, 5, 10, 23.36, 18.33, 719, 95.87],
    ["Труба", "ГОСТ Р 54157-2010", "150x100x5", "прямоугольная", 150, 100, 5, 10, 23.36, 18.33, 719.2, 95.89],

    // Angles (Уголок)
    ["Уголок", "ГОСТ 8509-93", "50x50x5", "равнополочный", 50, 50, 5, 5.5, 4.8, 3.77, 11.2, 3.13],
    ["Уголок", "ГОСТ 8509-93", "63x63x6", "равнополочный", 63, 63, 6, 7, 7.28, 5.72, 27.06, 5.98],
    ["Уголок", "ГОСТ 8509-93", "80x80x6", "равнополочный", 80, 80, 6, 9, 9.38, 7.36, 56.97, 9.8],
    ["Уголок", "ГОСТ 8509-93", "90x90x6", "равнополочный", 90, 90, 6, 10, 10.61, 8.33, 82.1, 12.49],
    ["Уголок", "ГОСТ 8509-93", "110x110x7", "равнополочный", 110, 110, 7, 12, 15.15, 11.89, 175.61, 21.83],

    // Strips (Полоса)
    ["Полоса", "ГОСТ 103-76", "4x40", "горячекатанная", 40, 4, undef, undef, undef, undef, undef, undef]
];

// ============================================================================
// HELPER FUNCTIONS - DATABASE ACCESS
// ============================================================================

// Get parameter from profile database
function get_profile_param(material, size, param, database = undef) =
    let(
        db = database == undef ? create_profile_database() : database,
        matched = [for (profile = db)
            if (profile[0] == material && profile[2] == size) profile
        ]
    )
    len(matched) > 0 ?
        let(profile = matched[0])
        param == "name" ? profile[0] :
        param == "standard" ? profile[1] :
        param == "size" ? profile[2] :
        param == "subtype" ? profile[3] :
        param == "h" ? profile[4] :
        param == "b" ? profile[5] :
        param == "s" ? profile[6] :
        param == "t" ? profile[7] :
        param == "r" ? profile[8] :
        param == "R" ? profile[9] :
        param == "A" ? profile[10] :
        param == "mass" ? profile[11] :
        undef
    : undef;

// Get beam type and size based on component, container type, and sandwich thickness
function get_beam_spec(component_name, container_type, sandwich_thick) =
    let(
        specs = [
            // Upper frame longitudinal beams
            ["Балка продольная левая верхней рамы", "ПБК", 50, "Уголок", "63x63x6"],
            ["Балка продольная левая верхней рамы", "ПБК", 80, "Уголок", "90x90x6"],
            ["Балка продольная левая верхней рамы", "ПБК", 100, "Уголок", "110x110x7"],
            ["Балка продольная левая верхней рамы", "УБК", 50, "Труба", "80x40x3"],
            ["Балка продольная левая верхней рамы", "УБК", 80, "Труба", "80x40x3"],
            ["Балка продольная левая верхней рамы", "УБК", 100, "Труба", "80x40x3"],

            ["Балка продольная правая верхней рамы", "ПБК", 50, "Уголок", "63x63x6"],
            ["Балка продольная правая верхней рамы", "ПБК", 80, "Уголок", "90x90x6"],
            ["Балка продольная правая верхней рамы", "ПБК", 100, "Уголок", "110x110x7"],
            ["Балка продольная правая верхней рамы", "УБК", 50, "Труба", "80x40x3"],
            ["Балка продольная правая верхней рамы", "УБК", 80, "Труба", "80x40x3"],
            ["Балка продольная правая верхней рамы", "УБК", 100, "Труба", "80x40x3"],

            // Upper frame transverse beams
            ["Балка поперечная передняя верхней рамы", "ПБК", 50, "Уголок", "63x63x6"],
            ["Балка поперечная передняя верхней рамы", "ПБК", 80, "Уголок", "90x90x6"],
            ["Балка поперечная передняя верхней рамы", "ПБК", 100, "Уголок", "110x110x7"],
            ["Балка поперечная передняя верхней рамы", "УБК", 50, "Труба", "80x40x3"],
            ["Балка поперечная передняя верхней рамы", "УБК", 80, "Труба", "80x40x3"],
            ["Балка поперечная передняя верхней рамы", "УБК", 100, "Труба", "80x40x3"],

            ["Балка поперечная задняя верхней рамы", "ПБК", 50, "Уголок", "63x63x6"],
            ["Балка поперечная задняя верхней рамы", "ПБК", 80, "Уголок", "90x90x6"],
            ["Балка поперечная задняя верхней рамы", "ПБК", 100, "Уголок", "110x110x7"],
            ["Балка поперечная задняя верхней рамы", "УБК", 50, "Труба", "80x40x3"],
            ["Балка поперечная задняя верхней рамы", "УБК", 80, "Труба", "80x40x3"],
            ["Балка поперечная задняя верхней рамы", "УБК", 100, "Труба", "80x40x3"],

            // Corner posts
            ["Стойка угловая передняя левая", "ПБК", 50, "Уголок", "63x63x6"],
            ["Стойка угловая передняя левая", "ПБК", 80, "Уголок", "90x90x6"],
            ["Стойка угловая передняя левая", "ПБК", 100, "Уголок", "110x110x7"],
            ["Стойка угловая передняя левая", "УБК", 50, "Труба", "150x100x5"],
            ["Стойка угловая передняя левая", "УБК", 80, "Труба", "150x100x5"],
            ["Стойка угловая передняя левая", "УБК", 100, "Труба", "150x100x5"],

            ["Стойка угловая передняя правая", "ПБК", 50, "Уголок", "63x63x6"],
            ["Стойка угловая передняя правая", "ПБК", 80, "Уголок", "90x90x6"],
            ["Стойка угловая передняя правая", "ПБК", 100, "Уголок", "110x110x7"],
            ["Стойка угловая передняя правая", "УБК", 50, "Труба", "150x100x5"],
            ["Стойка угловая передняя правая", "УБК", 80, "Труба", "150x100x5"],
            ["Стойка угловая передняя правая", "УБК", 100, "Труба", "150x100x5"],

            ["Стойка угловая задняя левая", "ПБК", 50, "Уголок", "63x63x6"],
            ["Стойка угловая задняя левая", "ПБК", 80, "Уголок", "90x90x6"],
            ["Стойка угловая задняя левая", "ПБК", 100, "Уголок", "110x110x7"],
            ["Стойка угловая задняя левая", "УБК", 50, "Труба", "150x100x5"],
            ["Стойка угловая задняя левая", "УБК", 80, "Труба", "150x100x5"],
            ["Стойка угловая задняя левая", "УБК", 100, "Труба", "150x100x5"],

            ["Стойка угловая задняя правая", "ПБК", 50, "Уголок", "63x63x6"],
            ["Стойка угловая задняя правая", "ПБК", 80, "Уголок", "90x90x6"],
            ["Стойка угловая задняя правая", "ПБК", 100, "Уголок", "110x110x7"],
            ["Стойка угловая задняя правая", "УБК", 50, "Труба", "150x100x5"],
            ["Стойка угловая задняя правая", "УБК", 80, "Труба", "150x100x5"],
            ["Стойка угловая задняя правая", "УБК", 100, "Труба", "150x100x5"],

            // Intermediate posts
            ["Стойка промежуточная левая", "ПБК", 50, "Уголок", "50x50x5"],
            ["Стойка промежуточная левая", "ПБК", 80, "Уголок", "80x80x6"],
            ["Стойка промежуточная левая", "ПБК", 100, "Уголок", "90x90x6"],
            ["Стойка промежуточная левая", "УБК", 50, "Труба", "40x40x3"],
            ["Стойка промежуточная левая", "УБК", 80, "Труба", "40x40x3"],
            ["Стойка промежуточная левая", "УБК", 100, "Труба", "40x40x3"],

            ["Стойка промежуточная правая", "ПБК", 50, "Уголок", "50x50x5"],
            ["Стойка промежуточная правая", "ПБК", 80, "Уголок", "80x80x6"],
            ["Стойка промежуточная правая", "ПБК", 100, "Уголок", "90x90x6"],
            ["Стойка промежуточная правая", "УБК", 50, "Труба", "40x40x3"],
            ["Стойка промежуточная правая", "УБК", 80, "Труба", "40x40x3"],
            ["Стойка промежуточная правая", "УБК", 100, "Труба", "40x40x3"],

            // Additional beams
            ["Дополнительные балки для каркаса навесных элементов стен", "ПБК", 50, "Уголок", "50x50x5"],
            ["Дополнительные балки для каркаса навесных элементов стен", "ПБК", 80, "Уголок", "50x50x5"],
            ["Дополнительные балки для каркаса навесных элементов стен", "ПБК", 100, "Уголок", "50x50x5"],
            ["Дополнительные балки для каркаса навесных элементов стен", "УБК", 50, "Труба", "40x40x3"],
            ["Дополнительные балки для каркаса навесных элементов стен", "УБК", 80, "Труба", "40x40x3"],
            ["Дополнительные балки для каркаса навесных элементов стен", "УБК", 100, "Труба", "40x40x3"]
        ],
        matched = [for (spec = specs)
            if (spec[0] == component_name && spec[1] == container_type && spec[2] == sandwich_thick)
            [spec[3], spec[4]]
        ]
    )
    len(matched) > 0 ? matched[0] : ["Unknown", "Unknown"];

// Generate coordinate array with specified step
function generate_coords(length, step, min_offset = 200, max_offset = 200) =
    let(
        start = (length - ceil(length / step) * step),
        coords = [for (i = [0 : ceil(length / step)]) start + i * step]
    )
    [for (c = coords) if (c >= min_offset && c <= length - max_offset) c];

// Generate coordinates for intermediate posts
function generate_post_coords(length) =
    length < 4000 ? [] :
    length <= 6000 ? [length / 2] :
    [for (i = [1 : floor((length - 500) / 2500)]) i * 2500];

// Select steel type based on temperature
function select_steel_type(temperature) =
    temperature < -45 ? "09Г2С (ниже -45°С)" : "Сталь 3 (до -45°С)";

// Get profile color based on type
function get_profile_color(profile_type) =
    profile_type == "Швеллер" ? [0.25, 0.25, 0.25] :
    profile_type == "Уголок" ? [0.35, 0.35, 0.35] :
    profile_type == "Труба" ? [0.65, 0.65, 0.65] :
    profile_type == "Полоса" ? [0.85, 0.85, 0.85] :
    [0.50, 0.50, 0.50];

// ============================================================================
// GEOMETRIC PRIMITIVES
// ============================================================================

// Create a simple box wall element
module wall_element(width, height, length, position = [0, 0, 0], offset = 1) {
    translate(position) {
        cube([width, height, length - offset], center = true);
    }
}

// Create a profile detail
module profile_detail(
    material,
    size,
    length,
    position = [0, 0, 0],
    rotation = [0, 0, 0],
    locks = [0, 0, 0, 0, 0, 0, 0, 0],
    assembly = "Assembly",
    component = "Component"
) {
    h = get_profile_param(material, size, "h");
    b = get_profile_param(material, size, "b");
    s = get_profile_param(material, size, "s");
    t = get_profile_param(material, size, "t");

    color(get_profile_color(material)) {
        translate(position) {
            rotate(rotation) {
                // Simplified profile representation
                if (material == "Труба") {
                    // Hollow rectangular/square tube
                    difference() {
                        cube([h, b, length], center = true);
                        cube([h - 2*s, b - 2*s, length + 1], center = true);
                    }
                } else if (material == "Швеллер") {
                    // Channel profile (simplified)
                    cube([h, b, length], center = true);
                } else if (material == "Уголок") {
                    // Angle profile (simplified L-shape)
                    cube([h, b, length], center = true);
                } else if (material == "Полоса") {
                    // Flat strip
                    cube([h, b, length], center = true);
                }
            }
        }
    }
}

// ============================================================================
// MAIN CONTAINER MODULE (SIMPLIFIED VERSION)
// ============================================================================

module simplified_container() {
    // Get beam specifications
    db = create_profile_database();

    // Calculate main dimensions
    L = container_length;
    W = container_width;
    H = container_height;

    // Base frame channel size
    channel_h = get_profile_param("Швеллер", main_beam_type, "h", db);
    channel_b = get_profile_param("Швеллер", main_beam_type, "b", db);
    channel_s = get_profile_param("Швеллер", main_beam_type, "s", db);
    channel_t = get_profile_param("Швеллер", main_beam_type, "t", db);

    echo("Container dimensions:", L, W, H);
    echo("Base channel:", main_beam_type, "h=", channel_h, "b=", channel_b);
    echo("Steel type:", select_steel_type(temperature_mode));

    // Base frame
    color([0.3, 0.3, 0.3]) {
        // Longitudinal beams
        translate([L/2, -channel_b/2, channel_h/2])
            cube([L, channel_b, channel_h], center = true);
        translate([L/2, -W + channel_b/2, channel_h/2])
            cube([L, channel_b, channel_h], center = true);

        // Transverse beams
        translate([channel_b/2, -W/2, channel_h/2])
            cube([channel_b, W, channel_h], center = true);
        translate([L - channel_b/2, -W/2, channel_h/2])
            cube([channel_b, W, channel_h], center = true);
    }

    // Vertical corner posts
    post_spec = get_beam_spec("Стойка угловая передняя левая", container_type, sandwich_thickness);
    post_h = get_profile_param(post_spec[0], post_spec[1], "h", db);

    if (post_h != undef) {
        color([0.4, 0.4, 0.4]) {
            // Four corner posts
            translate([post_h/2, -post_h/2, H/2 + channel_h/2])
                cube([post_h, post_h, H], center = true);
            translate([L - post_h/2, -post_h/2, H/2 + channel_h/2])
                cube([post_h, post_h, H], center = true);
            translate([post_h/2, -W + post_h/2, H/2 + channel_h/2])
                cube([post_h, post_h, H], center = true);
            translate([L - post_h/2, -W + post_h/2, H/2 + channel_h/2])
                cube([post_h, post_h, H], center = true);
        }
    }

    // Top frame
    color([0.35, 0.35, 0.35]) {
        translate([L/2, -post_h/2, H + channel_h])
            cube([L, post_h, post_h], center = true);
        translate([L/2, -W + post_h/2, H + channel_h])
            cube([L, post_h, post_h], center = true);
        translate([post_h/2, -W/2, H + channel_h])
            cube([post_h, W, post_h], center = true);
        translate([L - post_h/2, -W/2, H + channel_h])
            cube([post_h, W, post_h], center = true);
    }

    // Sandwich panels (simplified)
    if (sandwich_thickness > 0) {
        color([0.9, 0.95, 1.0], transparency) {
            // Front wall
            translate([L/2, -sandwich_thickness/2, H/2 + channel_h])
                cube([L - 2*post_h, sandwich_thickness, H], center = true);

            // Back wall
            translate([L/2, -W + sandwich_thickness/2, H/2 + channel_h])
                cube([L - 2*post_h, sandwich_thickness, H], center = true);

            // Left wall
            translate([sandwich_thickness/2, -W/2, H/2 + channel_h])
                cube([sandwich_thickness, W - 2*post_h, H], center = true);

            // Right wall
            translate([L - sandwich_thickness/2, -W/2, H/2 + channel_h])
                cube([sandwich_thickness, W - 2*post_h, H], center = true);

            // Roof
            translate([L/2, -W/2, H + channel_h + sandwich_thickness/2])
                cube([L, W, sandwich_thickness], center = true);
        }
    }

    // Floor decking
    color([0.6, 0.6, 0.6], transparency) {
        translate([L/2, -W/2, 0])
            cube([L, W, 2], center = true);
    }
}

// ============================================================================
// EXECUTE
// ============================================================================

simplified_container();

// ============================================================================
// USAGE NOTES:
// ============================================================================
// This improved version includes:
// 1. Proper English comments and documentation
// 2. Organized parameter sections with clear names
// 3. Centralized database functions
// 4. Helper functions for common calculations
// 5. Modular structure for easy maintenance
// 6. Simplified visualization for performance
//
// To use the full detailed version, you would need to:
// - Add the detailed profile rendering modules
// - Include STL file paths as parameters
// - Implement door, cable entry, and other detailed components
// - Add roof truss system
// - Implement full drainage system
// ============================================================================
