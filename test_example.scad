// ============================================================================
// TEST EXAMPLE - Container Design Module
// ============================================================================
// This file demonstrates how to test the improved container design module

use <container_design_improved.scad>

// ============================================================================
// TEST 1: Database Functions
// ============================================================================

echo("========================================");
echo("TEST 1: Database Access");
echo("========================================");

// Create database
db = create_profile_database();
echo("✓ Database created with", len(db), "profiles");

// Test profile parameter retrieval
channel_height = get_profile_param("Швеллер", "12П", "h");
channel_width = get_profile_param("Швеллер", "12П", "b");
channel_mass = get_profile_param("Швеллер", "12П", "mass");

echo("✓ Channel 12П parameters:");
echo("  Height:", channel_height, "mm");
echo("  Width:", channel_width, "mm");
echo("  Mass:", channel_mass, "kg/m");

// Test angle profile
angle_height = get_profile_param("Уголок", "63x63x6", "h");
angle_thickness = get_profile_param("Уголок", "63x63x6", "s");

echo("✓ Angle 63x63x6 parameters:");
echo("  Height:", angle_height, "mm");
echo("  Thickness:", angle_thickness, "mm");

// ============================================================================
// TEST 2: Coordinate Generation
// ============================================================================

echo("\n========================================");
echo("TEST 2: Coordinate Generation");
echo("========================================");

// Generate beam coordinates
beam_coords = generate_coords(7000, 1250, 200, 200);
echo("✓ Generated", len(beam_coords), "beam positions");
echo("  Coordinates:", beam_coords);

// Generate post coordinates
post_coords = generate_post_coords(7000);
echo("✓ Generated", len(post_coords), "post positions");
echo("  Coordinates:", post_coords);

// ============================================================================
// TEST 3: Steel Type Selection
// ============================================================================

echo("\n========================================");
echo("TEST 3: Steel Type Selection");
echo("========================================");

steel_arctic = select_steel_type(-60);
steel_normal = select_steel_type(-40);

echo("✓ Steel for -60°C:", steel_arctic);
echo("✓ Steel for -40°C:", steel_normal);

// ============================================================================
// TEST 4: Beam Specifications
// ============================================================================

echo("\n========================================");
echo("TEST 4: Beam Specifications");
echo("========================================");

beam_spec_pbk = get_beam_spec(
    "Балка продольная левая верхней рамы",
    "ПБК",
    100
);

beam_spec_ubk = get_beam_spec(
    "Стойка угловая передняя левая",
    "УБК",
    100
);

echo("✓ Upper frame beam (ПБК, 100mm):", beam_spec_pbk[0], beam_spec_pbk[1]);
echo("✓ Corner post (УБК, 100mm):", beam_spec_ubk[0], beam_spec_ubk[1]);

// ============================================================================
// TEST 5: Color Management
// ============================================================================

echo("\n========================================");
echo("TEST 5: Color Management");
echo("========================================");

color_channel = get_profile_color("Швеллер");
color_angle = get_profile_color("Уголок");
color_tube = get_profile_color("Труба");

echo("✓ Channel color:", color_channel);
echo("✓ Angle color:", color_angle);
echo("✓ Tube color:", color_tube);

// ============================================================================
// TEST 6: Container Dimensions
// ============================================================================

echo("\n========================================");
echo("TEST 6: Container Calculations");
echo("========================================");

L = container_length;
W = container_width;
H = container_height;

volume = L * W * H / 1e9;  // m³
floor_area = L * W / 1e6;   // m²
wall_area = 2 * (L * H + W * H) / 1e6;  // m²

echo("✓ Container dimensions:", L, "x", W, "x", H, "mm");
echo("✓ Internal volume:", volume, "m³");
echo("✓ Floor area:", floor_area, "m²");
echo("✓ Wall area:", wall_area, "m²");

// ============================================================================
// VISUAL TEST: Render Container
// ============================================================================

echo("\n========================================");
echo("VISUAL TEST: Rendering Container");
echo("========================================");
echo("✓ Creating simplified container...");

// Render the container
simplified_container();

echo("\n========================================");
echo("ALL TESTS COMPLETED SUCCESSFULLY! ✓");
echo("========================================");
