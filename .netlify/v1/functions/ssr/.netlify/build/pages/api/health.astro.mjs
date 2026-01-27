import { s as supabase } from '../../chunks/supabase_CzzrOyyL.mjs';
export { renderers } from '../../renderers.mjs';

const GET = async () => {
  const health = {
    status: "ok",
    timestamp: (/* @__PURE__ */ new Date()).toISOString(),
    services: {
      supabase: "unknown"
    }
  };
  try {
    const { error } = await supabase.from("leads").select("id").limit(1);
    health.services.supabase = error ? "error" : "ok";
  } catch {
    health.services.supabase = "error";
  }
  const allHealthy = Object.values(health.services).every((s) => s === "ok");
  health.status = allHealthy ? "ok" : "degraded";
  return new Response(JSON.stringify(health, null, 2), {
    status: allHealthy ? 200 : 503,
    headers: { "Content-Type": "application/json" }
  });
};

const _page = /*#__PURE__*/Object.freeze(/*#__PURE__*/Object.defineProperty({
  __proto__: null,
  GET
}, Symbol.toStringTag, { value: 'Module' }));

const page = () => _page;

export { page };
