import csv
import numpy as np
import matplotlib.pyplot as plt

L = 4
NCOEFF = 256

LOG_FILE = "cs1_log.csv"

values = []

with open(LOG_FILE, newline="") as f:
    reader = csv.reader(f)

    for row in reader:
        coeffs = list(map(int, row[3:]))

        if len(coeffs) != L * NCOEFF:
            continue

        values.extend(coeffs)

values = np.array(values)

print(f"Loaded {len(values)} coefficients")
print(f"Min = {values.min()}")
print(f"Max = {values.max()}")
print(f"Mean = {values.mean():.6f}")
print(f"Std  = {values.std():.6f}")

plt.figure(figsize=(10,6))

plt.hist(values, bins=200)

plt.xlabel("c*s1 coefficient value")
plt.ylabel("Frequency")
plt.title("Histogram of c*s1 coefficients")

plt.grid(True)

plt.savefig("cs1_histogram.png", dpi=300)

plt.show()