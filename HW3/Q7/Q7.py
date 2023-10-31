import math
import matplotlib.pyplot as plt

lat_tt = 34.02059
lon_tt = -118.28545

R = 36
r = 9
a = 30


def spirograph_coordinates(t):
    x = (R + r) * math.cos((r / R) * t) - a * math.cos((1 + r / R) * t)
    y = (R + r) * math.sin((r / R) * t) - a * math.sin((1 + r / R) * t)
    return x, y

points = []
for i in range(0, int(8 * math.pi * 100)):
    x, y = spirograph_coordinates(i/100)
    lon = lon_tt + x/1000
    lat = lat_tt + y/1000
    points.append([lon, lat])

lons = [point[0] for point in points]
lats = [point[1] for point in points]

plt.figure(figsize=(10, 10))
plt.plot(lons, lats, label="Spirograph Curve")
plt.scatter(lon_tt, lat_tt, color="red", label="Tommy Trojan Center", s=100)
plt.legend()
plt.title("Spirograph Curve around Tommy Trojan")
plt.xlabel("Longitude")
plt.ylabel("Latitude")
plt.grid(True)
plt.show()

with open("spirograph.kml", "w") as f:
    f.write("<?xml version='1.0' encoding='UTF-8'?>\n")
    f.write("<kml xmlns='http://www.opengis.net/kml/2.2'>\n")
    f.write("<Document>\n")

    # 添加中心点
    f.write("    <Placemark>\n")
    f.write("        <name>Center Point</name>\n")
    f.write("        <Point>\n")
    f.write("            <coordinates>{},{},0</coordinates>\n".format(lon_tt, lat_tt))
    f.write("        </Point>\n")
    f.write("    </Placemark>\n")

    # 添加Spirograph曲线的点
    for lon, lat in points:
        f.write("    <Placemark>\n")
        f.write("        <name>Point</name>\n")
        f.write("        <Point>\n")
        f.write("            <coordinates>{},{},0</coordinates>\n".format(lon, lat))
        f.write("        </Point>\n")
        f.write("    </Placemark>\n")

    f.write("</Document>\n")
    f.write("</kml>\n")