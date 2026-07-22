(() => {
  const minimumPingIntervalMs = 30000;
  let lastPing = 0;

  function reportActivity() {
    const now = Date.now();
    if (now - lastPing < minimumPingIntervalMs) return;
    lastPing = now;

    fetch(`/activity-ping?at=${now}`, {
      method: "POST",
      cache: "no-store",
      keepalive: true,
      credentials: "same-origin"
    }).catch(() => {
      // A missed heartbeat is harmless. The next input event will retry.
    });
  }

  [
    "pointerdown",
    "pointermove",
    "keydown",
    "wheel",
    "touchstart"
  ].forEach((eventName) => {
    window.addEventListener(eventName, reportActivity, {
      capture: true,
      passive: true
    });
  });

  window.addEventListener("focus", reportActivity);
  document.addEventListener("visibilitychange", () => {
    if (document.visibilityState === "visible") reportActivity();
  });

  reportActivity();
})();
