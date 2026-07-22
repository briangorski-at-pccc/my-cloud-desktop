# Brian's browser desktop

This is a persistent Ubuntu XFCE desktop that opens in an ordinary web browser. It uses the web-native Selkies desktop stream, not VNC or noVNC, and requires no desktop client or browser extension.

## One-time setup

1. In **GitHub Settings → Codespaces**, set **Default idle timeout** to **5 minutes**.
2. Do not add a payment method for Codespaces. With no valid payment method, GitHub blocks usage when the included quota is exhausted instead of charging you.
3. On this repository's **Code → Codespaces** tab, choose **Create codespace on main**. Keep the default **2-core** machine.
4. The first build downloads the Ubuntu desktop image and can take several minutes. A tab labeled **Open Cloud Desktop** should open automatically when it is ready.

## Normal use

- Open the Codespace from <https://github.com/codespaces>. The desktop tab should reopen automatically.
- Sign in to websites only inside the desktop's Chromium browser. Its profile, documents, and settings live in a persistent Docker volume.
- Mouse or keyboard activity sends a small local heartbeat. When there is no activity for five minutes, GitHub stops the Codespace; opening it later resumes the same stored desktop.
- If the desktop tab does not open automatically, use the **Ports** panel in the Codespaces editor and click the globe beside **Open Cloud Desktop**.

## Free-use boundaries

- GitHub Free includes 120 core-hours per month. On the required 2-core machine, that is about **60 actual running hours per month**.
- It also includes 15 GB-month of Codespaces storage.
- Without a valid payment method, over-quota use is blocked rather than billed.
- Keep only this one Codespace to avoid wasting the storage allowance.

## What persists

The desktop home folder is stored in the `desktop-home` Docker volume. It survives normal five-minute stops, starts, and container restarts. Deleting the entire Codespace also deletes that volume, so download irreplaceable files through the desktop's file-transfer panel before deleting the Codespace.
