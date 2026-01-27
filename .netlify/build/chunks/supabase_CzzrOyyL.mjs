import { createClient } from '@supabase/supabase-js';

const supabaseUrl = "https://qyfzghixdrhsdrwlgajh.supabase.co";
const supabasePublishableKey = "sb_publishable_PdHWZZ-E-JmhV1zEHWf4uA_BKUWNp_W";
const supabase = createClient(supabaseUrl, supabasePublishableKey);

export { supabase as s };
