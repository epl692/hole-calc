using namespace std;
extern "C" double hole_calc(double volume, double diameter)
{
    // Convert diameter to radius
    double radius = diameter / 2.0;

    //Calculate the volume in cubic inches
    double volumeInCubicInches = volume * 1728.00;

    // Calculate the depth using the volume, radius, and pi
    double depth = volumeInCubicInches / ((radius * radius) * 3.141592);

    return depth;
}