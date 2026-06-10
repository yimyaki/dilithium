import csv
import numpy as np
import matplotlib.pyplot as plt

L = 4      # Dilithium2
NCOEFF = 256

LOG_FILE = "cs1_log.csv"
S1_FILE = "s1_secret.csv"

def threshold_value(x):
    if x < -1.2:
        return -2
    elif x < -0.4:
        return -1
    elif x <= 0.4:
        return 0
    elif x <= 1.2:
        return 1
    else:
        return 2

# Load secret s1
s1 = np.zeros((L, NCOEFF), dtype=int)

with open(S1_FILE, newline="") as f:
    reader = csv.DictReader(f)
    for row in reader:
        i = int(row["vec"])
        j = int(row["coeff"])
        v = int(row["value"])
        s1[i, j] = v

# Load cs1 attempts
#attempts = {}
arrays = []

with open(LOG_FILE, newline="") as f:
    reader = csv.reader(f)

    for row in reader:
        trace_id = int(row[0])
        status = row[1]
        attempt = int(row[2])

        values = list(map(int, row[3:]))

        if len(values) != L * NCOEFF:
            print(f"Skipping bad row {trace_id}, got {len(values)} coeffs")
            continue

        arr = np.array(values, dtype=float).reshape((L, NCOEFF))
        arrays.append(arr)

print(f"Loaded {len(arrays)} traces")

# Sort attempts by attempt number
#attempt_ids = sorted(attempts.keys())
#arrays = [attempts[a] for a in attempt_ids]

#print(f"Loaded {len(arrays)} attempts")

Ns = list(range(10000, 499, -100))

accuracies = []

for n in Ns:
    if n > len(arrays):
        print(f"Skipping N={n}, only {len(arrays)} attempts available")
        continue

    avg = np.mean(arrays[:n], axis=0)

    thresholded = np.vectorize(threshold_value)(avg)

    correct = np.sum(thresholded == s1)
    total = L * NCOEFF
    acc = correct / total

    accuracies.append((n, acc))

    print(f"N={n:5d}, correct={correct}/{total}, accuracy={acc:.6f}")

# Save accuracy results
with open("accuracy_vs_N.csv", "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerow(["N", "accuracy"])
    for n, acc in accuracies:
        writer.writerow([n, acc])

# Plot
Ns_plot = [x[0] for x in accuracies]
acc_plot = [x[1] for x in accuracies]

plt.figure()
plt.plot(Ns_plot, acc_plot, marker="o")
plt.xlabel("Number of averaged attempts")
plt.ylabel("Secret coefficient recovery accuracy")
plt.title("Accuracy vs Number of Averaged c*s1 Samples")
plt.grid(True)
plt.gca().invert_xaxis()
plt.savefig("accuracy_vs_N.png", dpi=300)
plt.show()