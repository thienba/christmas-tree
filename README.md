# 🎄 Grand Luxury Interactive Christmas Tree

An immersive, high-fidelity 3D Christmas tree experience featuring hand gesture control, dynamic chaos-to-order assembly, and luxurious emerald and gold aesthetics.

## 📝 Prompt

Created with Gemini 3 in Google AI Studio and Claude 4.5 Sonnet in Cursor:

```
Role: You are a 3D creative development expert proficient in React 19, TypeScript, and Three.js (R3F).

Objective: Build a high-fidelity 3D web application called "Grand Luxury Interactive Christmas Tree". The visual style should present a "Trump-style" luxury feel with a main color scheme of deep emerald green and highlight gold, accompanied by cinematic glow effects.

Tech Stack: React 19, TypeScript, React Three Fiber, Drei, Postprocessing, Tailwind CSS.

Core Logic & Architecture:
- State Machine: Contains two states - CHAOS (scattered chaos) and FORMED (assembled into tree), with dynamic morphing between them.
- Dual-Position System: All elements (foliage, ornaments) need two coordinates assigned during initialization:
  - ChaosPosition: Random coordinates within spherical space
  - TargetPosition: Target coordinates forming the tree cone shape
  - Interpolate (Lerp) between them based on progress in useFrame

Implementation Details:
- Foliage System: Uses THREE.Points and custom ShaderMaterial to render many particles
- Ornaments: Uses InstancedMesh for optimized rendering. Divided into gift boxes of various colors (heavy), colored balls (light), and decorative lights (very light), assigned different physical thrust weights. Uses Lerp for smooth return animations
- Post-processing: Enable Bloom effect (threshold 0.8, intensity 1.2) to create "golden halo"
- Scene Configuration: Camera position [0, 4, 20], using Lobby HDRI environment lighting

Additional Features:
- Add many Polaroid-style photo decorations
- Use webcam image detection for hand gestures: open hand represents unleash, closed fist returns to tree form. Hand movement adjusts the view angle.
```

## 🛠️ Installation

1. **Clone the repository:**
   ```bash
   git clone <repository-url>
   cd grand-luxury-interactive-christmas-tree
   ```

2. **Install dependencies:**
   ```bash
   npm install
   ```

3. **Run the development server:**
   ```bash
   npm run dev
   ```
   
   > 📝 Note: Local dev mode uses localStorage for sharing (works in same browser only)
   > For full cloud sharing, see step 4

4. **Configure Cloudflare (Optional - for cloud sharing):**
   - Follow the detailed guide in `cloudflare-setup.md`
   - Copy `env.example` to `.env.local` and fill in your Cloudflare credentials
   - Use `npm run dev:vercel` to test with full Vercel environment

5. **Open your browser:**
   - Navigate to `http://localhost:3010`
   - Allow camera access for gesture control
   - Click "Upload Photos" to upload your photos


## 🎯 Usage

### Photo Upload & Sharing

1. **Upload Photos:**
   - Click "Upload Photos" button to select up to 22 images
   - Photos will appear as polaroids on the Christmas tree

2. **Generate Share Link:**
   - After uploading photos, click "Generate Share Link"
   - Wait 2-3 seconds for the upload to complete
   - Copy the generated link and share with friends

3. **View Shared Photos:**
   - Friends can open the share link in any browser
   - Photos will automatically load on the Christmas tree
   - No login or app installation required
   - Links expire after 30 days

### Gesture Controls

1. **Position your hand** in front of the webcam (visible in top-right preview)
2. **Move your hand** to control the camera angle:
   - Left/Right: Horizontal rotation
   - Up/Down: Vertical tilt
3. **Open your hand** (spread all fingers): Unleash chaos mode
4. **Close your fist**: Restore tree to formed mode

### Mouse Controls

When no hand is detected, you can:
- **Click and drag** to rotate the view
- **Scroll** to zoom in/out
- **Right-click and drag** to pan (disabled by default)

## 🏗️ Tech Stack

### Frontend
- React 19 with TypeScript
- React Three Fiber (R3F) for 3D rendering
- Three.js for WebGL graphics
- @react-three/drei for helpers
- @react-three/postprocessing for visual effects
- MediaPipe for hand gesture detection
- Tailwind CSS for styling

### Backend (Photo Sharing)
- Vercel Serverless Functions
- Cloudflare R2 (S3-compatible object storage)
- Cloudflare KV (key-value storage)
- AWS SDK S3 Client for R2 integration

### Features
- Hand gesture control via webcam
- Dynamic state transitions (CHAOS ↔ FORMED)
- Photo upload and cloud sharing
- Temporary share links (30-day expiration)
- Instanced rendering for performance
- Bloom and post-processing effects

## 🎅 Happy Holidays!

May your code be merry and bright! 🎄✨
