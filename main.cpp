#include <iostream>
using namespace std;
// hole_calc(volume, diameter)
extern "C" double hole_calc(double, double);

int main()
{
    double diameter, volume;
    cout << "Please enter the diameter in in, press enter and then the volume in cubic feet, and press enter again." << endl;
    cin >> diameter >> volume;
    cout << "Dig hole to " << hole_calc(volume, diameter) << " in deep." << endl;
    return 0;
}