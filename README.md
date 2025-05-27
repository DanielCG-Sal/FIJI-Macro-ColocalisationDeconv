# ColocalizationDeconv.ijm

**FIJI/ImageJ macro for quantifying colocalisation between two fluorescence channels after deconvolution.**

This macro automates the analysis of colocalisation between two fluorescent markers in microscopy images. It performs iterative deconvolution, applies intensity thresholds, and measures the individual and overlapping signal areas within a manually defined region of interest (ROI).

---

## Requirements

- [FIJI / ImageJ](https://fiji.sc) (with the Deconvolution plugin installed)
- Multichannel fluorescence images (compatible with FIJI)
- Manually defined ROI using the ROI Manager

---

## Files

- `ColocalizationDeconv.ijm`: The main macro script.

---

## Usage

1. **Open** the image to be analysed in FIJI. Select the appropriate Z-plane and adjust intensity/contrast as needed.
2. **Outline** the cell or region of interest and add the selection to the ROI Manager.
3. In the macro code, define the channels to be analysed by editing the following lines:
    ```ijm
    run("Duplicate...", "title=C1 duplicate channels=__1__");
    run("Duplicate...", "title=C2 duplicate channels=__2__");
    ```
4. When prompted, manually adjust the **threshold** for each channel and confirm.
8. A results table will be generated with the following measurements:

| ROI               | Description                                  |
|------------------|----------------------------------------------|
| `Total`          | Total area of the selected cell or region    |
| `DC1`            | Area covered by the first channel            |
| `DC2`            | Area covered by the second channel           |
| `Colocalisation` | Area shared between both channels            |

---

## Output

The macro produces a measurement table in pixel units. Since the generated duplicates are not spatially calibrated, values are best interpreted as relative proportions. For quantitative comparisons across samples, consider normalising the values.

---

## Author

Developed by Daniela María Chávez Bulnes, Jorge Valero and Daniel Cañada García.  

---

## Licence

The macro is released under the GNU General Public License v3.0. See gpl-3.0.txt for details.

---

## Citation

If you use this workflow or any of the macros in your work, please cite:

> TBD
