# PTDPS
open source codes of paper:《Hyperspectral Anomaly Detection with Adaptive Parameter Determination via Topological Disassembly Guided Pixel-level Self-information》

DOI: 10.1109/TGRS.2026.3656937

# Abstract
Hyperspectral anomaly detection presents persistent challenges due to the limitations of existing methodologies. Conventional methods based on signal processing typically employ fixed model assumptions and operate within rigid analytical modes, resulting in limited adaptability to diverse imaging scenes and constrained feature extraction capabilities. Meanwhile, machine learning-based methods generally necessitate annotated training samples, parameter optimization, and computationally intensive model training, which restricts their practical implementation in practical scenarios. To address these challenges, this paper introduces an innovative perspective through the integration of point-set topology with information theory to analyze anomaly-background distribution characteristics within an imaging scene. This theoretical foundation enables enhanced characterization and extraction of discriminative information between these two distinct land covers. Adhering to a model-free design philosophy with data-adaptive parameter determination, we propose a novel method for hyperspectral anomaly detection, designated as PTDPS. The implementation of PTDPS comprises three fundamental stages: initially, a hyperspectral image (HSI) undergoes disassembly across spectral bands to generate parallel topological spaces; subsequently, the self-information associated with each pixel is evaluated using topological properties to quantify its uncertainty relative to the whole image, yielding initial anomaly scores; ultimately, these initial scores are refined through a weighting strategy based on topological deviation from predominant data populations. The proposed PTDPS establishes a universal detection scheme applicable to diverse hyperspectral data. Experimental validation confirms that our method delivers outstanding detection accuracy while maintaining competitive computational efficiency, demonstrating robust adaptability and generalization performance across varied imaging scenes. To facilitate reproducibility and future research, the source code for this work has been made publicly available at: https://github.com/sxt1996/PTDPS.
# Index Terms
Hyperspectral image, anomaly detection, point-set topology, self-information, model-free, adaptive parameter determination.
# Flowchart


# Data Set
AVIRIS-WTC: The data set was acquired on September 16, 2001 by NASA's Jet Propulsion Laboratory using the AVIRIS to image the World Trade Center (WTC) in New York. The experimental image preserves 224 spectral channels spanning the wavelength range of 370-2510 nm. This scene contains 200×200 pixels, of which the anomalies to be detected are fire sources, occupying 83 pixels in a total of 10 locations. 
# Guidelines
1. Install R2014a or higher versions of MATLAB.
2. Download this code package.
3. Set path.
4. Don't worry about importing data or anything else, just run Main.m.
# Contact
If you have any questions, please feel free to contact me.
sxt1996@outlook.com
