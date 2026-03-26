<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
<html>
<head>
<title>NutriCalc Pro</title>
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700;900ampfamily=DM+Sans:wght@300;400;500;600ampdisplay=swap" rel="stylesheet"/>
<style> :root { --green: #2d6a4f; --green-lt: #40916c; --lime: #b7e4c7; --cream: #f8f5ef; --paper: #fffdf9; --ink: #1a2e23; --muted: #6b7c72; --red: #c1440e; --gold: #d4a843; --shadow: 0 2px 20px rgba(45,106,79,.10); --shadow-lg:0 8px 40px rgba(45,106,79,.16); --radius: 16px; } *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; } body { font-family: 'DM Sans', sans-serif; background: var(--cream); color: var(--ink); min-height: 100vh; padding-bottom: 60px; } /* ── TOAST ── */ #toast { position: fixed; bottom: 28px; left: 50%; transform: translateX(-50%) translateY(80px); background: var(--ink); color: #fff; padding: 14px 32px; border-radius: 50px; font-size: 14px; font-weight: 500; letter-spacing: .3px; box-shadow: var(--shadow-lg); z-index: 9999; transition: transform .35s cubic-bezier(.34,1.56,.64,1), opacity .35s; opacity: 0; pointer-events: none; } #toast.show { transform: translateX(-50%) translateY(0); opacity: 1; } /* ── HEADER ── */ .header { background: var(--green); padding: 0 40px; display: flex; align-items: center; justify-content: space-between; height: 68px; position: sticky; top: 0; z-index: 200; box-shadow: 0 2px 24px rgba(0,0,0,.18); } .logo { font-family: 'Playfair Display', serif; color: #fff; font-size: 22px; letter-spacing: .5px; } .logo span { color: var(--lime); } .header-actions { display: flex; gap: 10px; } .btn-header { padding: 8px 18px; border-radius: 50px; border: none; font-family: 'DM Sans', sans-serif; font-size: 13px; font-weight: 600; cursor: pointer; transition: .2s; display: flex; align-items: center; gap: 6px; } .btn-header.outline { background: transparent; border: 1.5px solid rgba(255,255,255,.45); color: #fff; } .btn-header.outline:hover { background: rgba(255,255,255,.12); } .btn-header.filled { background: var(--lime); color: var(--ink); } .btn-header.filled:hover { background: #c8edda; } /* ── TABS ── */ .tabs { background: var(--paper); display: flex; border-bottom: 1.5px solid #e5e0d6; padding: 0 40px; } .tab-btn { padding: 18px 24px 16px; border: none; background: none; font-family: 'DM Sans', sans-serif; font-size: 14px; font-weight: 500; color: var(--muted); cursor: pointer; border-bottom: 2.5px solid transparent; margin-bottom: -1.5px; transition: .2s; letter-spacing: .2px; display: flex; align-items: center; gap: 8px; } .tab-btn .tab-icon { font-size: 16px; } .tab-btn:hover { color: var(--green); } .tab-btn.active { color: var(--green); border-bottom-color: var(--green); font-weight: 600; } /* ── LAYOUT ── */ .content-section { display: none; padding: 40px; max-width: 1080px; margin: auto; } .content-section.active { display: block; animation: fadeIn .25s ease; } @keyframes fadeIn { from { opacity: 0; transform: translateY(8px); } to { opacity: 1; transform: none; } } /* ── PAGE TITLES ── */ .page-title { font-family: 'Playfair Display', serif; font-size: 32px; font-weight: 900; color: var(--ink); margin-bottom: 28px; line-height: 1.15; } .page-title span { color: var(--green-lt); } /* ── CARDS ── */ .card { background: var(--paper); border-radius: var(--radius); box-shadow: var(--shadow); border: 1px solid #ede8df; padding: 28px 32px; margin-bottom: 20px; transition: box-shadow .25s; } .card:hover { box-shadow: var(--shadow-lg); } /* ── RECIPE CARD ── */ .recipe-card-header { display: flex; justify-content: space-between; align-items: flex-start; gap: 16px; flex-wrap: wrap; } .recipe-title { font-family: 'Playfair Display', serif; font-size: 22px; font-weight: 700; color: var(--ink); } .recipe-desc { font-size: 14px; color: var(--muted); margin-top: 4px; line-height: 1.55; } .recipe-actions { display: flex; gap: 8px; flex-shrink: 0; } .macro-row { display: flex; flex-wrap: wrap; gap: 8px; margin: 16px 0; } .macro-pill { display: inline-flex; align-items: center; gap: 5px; padding: 6px 14px; border-radius: 50px; font-size: 12px; font-weight: 600; letter-spacing: .2px; } .pill-cal { background: #fde8df; color: #c1440e; } .pill-prot { background: #dff5e8; color: #2d6a4f; } .pill-carb { background: #dfeeff; color: #1e5fa8; } .pill-fat { background: #fff3d4; color: #9a6f00; } .recipe-detail { border-top: 1px solid #ede8df; margin-top: 18px; padding-top: 18px; display: grid; grid-template-columns: 1fr 1fr; gap: 28px; } .recipe-detail h4 { font-size: 11px; text-transform: uppercase; letter-spacing: 1px; color: var(--muted); font-weight: 600; margin-bottom: 10px; } .recipe-detail ul, .recipe-detail ol { padding-left: 18px; font-size: 14px; color: var(--ink); line-height: 1.75; list-style-type: disc; } .recipe-detail ol { list-style-type: decimal; } /* ── FORM ── */ .grid-form { display: grid; grid-template-columns: 1.3fr 1fr; gap: 36px; } .form-group { margin-bottom: 18px; } label { display: block; font-size: 12px; font-weight: 600; text-transform: uppercase; letter-spacing: .8px; color: var(--muted); margin-bottom: 7px; } input[type="text"], input[type="number"], textarea, select { width: 100%; padding: 11px 14px; border: 1.5px solid #e0dbd2; border-radius: 10px; font-family: 'DM Sans', sans-serif; font-size: 14px; color: var(--ink); background: var(--cream); transition: border-color .2s, box-shadow .2s; outline: none; appearance: none; } input:focus, textarea:focus, select:focus { border-color: var(--green-lt); box-shadow: 0 0 0 3px rgba(64,145,108,.12); background: #fff; } textarea { resize: vertical; min-height: 72px; } .input-row { display: grid; grid-template-columns: 2fr 1fr auto; gap: 8px; align-items: end; } .input-row-2 { display: flex; gap: 8px; align-items: end; } .input-row-2 input, .input-row-2 textarea { flex: 1; } .section-sub { font-family: 'Playfair Display', serif; font-size: 17px; font-weight: 700; color: var(--ink); margin: 20px 0 12px; } /* ── BUTTONS ── */ .btn { display: inline-flex; align-items: center; gap: 6px; padding: 10px 18px; border-radius: 50px; border: none; font-family: 'DM Sans', sans-serif; font-size: 13px; font-weight: 600; cursor: pointer; transition: .2s; white-space: nowrap; } .btn-primary { background: var(--green); color: #fff; } .btn-primary:hover { background: var(--green-lt); } .btn-secondary { background: var(--lime); color: var(--ink); } .btn-secondary:hover { background: #c8edda; } .btn-danger { background: #fde8df; color: var(--red); } .btn-danger:hover { background: #fbd0c2; } .btn-ghost { background: transparent; border: 1.5px solid #ddd; color: var(--ink); } .btn-ghost:hover { background: var(--cream); } .btn-sm { padding: 7px 14px; font-size: 12px; } .btn-full { width: 100%; justify-content: center; padding: 14px; font-size: 15px; border-radius: 12px; margin-top: 8px; } .btn-icon { padding: 9px 13px; border-radius: 10px; } /* ── CAL PREVIEW ── */ #cal-preview { font-size: 20px; font-family: 'Playfair Display', serif; color: var(--green); font-weight: 700; margin-top: 10px; } /* ── DB LIST ── */ .db-item { background: var(--paper); border: 1px solid #ede8df; border-radius: 12px; padding: 12px 20px; display: flex; align-items: center; justify-content: space-between; margin-bottom: 8px; transition: box-shadow .2s; } .db-item:hover { box-shadow: var(--shadow); } .db-item-name { font-weight: 600; font-size: 14px; } .db-item-kcal { font-size: 13px; color: var(--muted); } /* ── EMPTY STATE ── */ .empty-state { text-align: center; padding: 60px 20px; color: var(--muted); } .empty-state .es-icon { font-size: 48px; margin-bottom: 16px; } .empty-state p { font-size: 15px; } /* ── DIVIDER ── */ .divider { border: none; border-top: 1px solid #ede8df; margin: 24px 0; } /* ── RESPONSIVE ── */ @media (max-width: 700px) { .header { padding: 0 20px; } .tabs { padding: 0 16px; } .content-section { padding: 24px 18px; } .grid-form { grid-template-columns: 1fr; } .recipe-detail { grid-template-columns: 1fr; } } </style>
</head>
<body onload="inicializarApp()">
<div id="toast"/>
<!--  HEADER  -->
<header class="header">
<div class="logo">
Nutri
<span>Calc</span>
Pro
</div>
<div class="header-actions">
<button class="btn-header outline" onclick="document.getElementById('import-file').click()"> 📂 Cargar XML </button>
<input type="file" id="import-file" style="display:none" accept=".xml" onchange="importarXML(this)"/>
<button class="btn-header filled" onclick="descargarXML()"> ⭳ Exportar XML </button>
</div>
</header>
<!--  TABS  -->
<nav class="tabs">
<button id="btn-view" class="tab-btn active" onclick="switchTab('tab-view', this)">
<span class="tab-icon">📋</span>
Mis Recetas
</button>
<button id="btn-create" class="tab-btn" onclick="switchTab('tab-create', this)">
<span class="tab-icon">➕</span>
Crear / Editar
</button>
<button id="btn-db" class="tab-btn" onclick="switchTab('tab-db', this)">
<span class="tab-icon">🍎</span>
Alimentos
</button>
</nav>
<!--  ═══ TAB: MIS RECETAS ═══  -->
<section id="tab-view" class="content-section active">
<h1 class="page-title">
Mi
<span>Recetario</span>
</h1>
<div id="recipe-list"/>
</section>
<!--  ═══ TAB: CREAR / EDITAR ═══  -->
<section id="tab-create" class="content-section">
<div class="card">
<h1 class="page-title" id="form-title" style="margin-bottom:24px;">
Nueva
<span>Receta</span>
</h1>
<div class="grid-form">
<!--  Columna izquierda  -->
<div>
<div class="form-group">
<label>Título de la receta</label>
<input type="text" id="r-titulo" placeholder="Ej: Ensalada de quinoa y aguacate"/>
</div>
<div class="form-group">
<label>Descripción</label>
<textarea id="r-desc" rows="3" placeholder="Describe brevemente tu receta..."/>
</div>
<p class="section-sub">Ingredientes</p>
<div class="input-row">
<select id="r-ing-select"/>
<input type="number" id="r-ing-cant" value="100" placeholder="g"/>
<button class="btn btn-primary btn-icon" onclick="addIngToRecipe()" title="Agregar">+</button>
</div>
<ul id="list-ingredientes-receta" style="margin-top:12px; padding-left:18px; font-size:14px; line-height:2;"/>
</div>
<!--  Columna derecha  -->
<div>
<p class="section-sub">Utensilios</p>
<div class="input-row-2">
<input type="text" id="u-nombre" placeholder="Ej: Sartén antiadherente"/>
<button class="btn btn-secondary btn-icon" onclick="addToList('u-nombre', tempUtensilios, 'list-utensilios')" title="Agregar">+</button>
</div>
<ul id="list-utensilios" style="margin-top:12px; padding-left:18px; font-size:14px; line-height:2;"/>
<hr class="divider"/>
<p class="section-sub">Pasos de preparación</p>
<div class="input-row-2">
<textarea id="p-nombre" rows="2" placeholder="Describe el siguiente paso..."/>
<button class="btn btn-secondary btn-icon" onclick="addToList('p-nombre', tempPasos, 'list-pasos')" title="Agregar">+</button>
</div>
<ol id="list-pasos" style="margin-top:12px; padding-left:20px; font-size:14px; line-height:2;"/>
</div>
</div>
<hr class="divider"/>
<button id="btn-save-recipe" class="btn btn-primary btn-full" onclick="guardarReceta()"> 💾 Guardar Receta </button>
<button id="btn-cancel-edit" class="btn btn-danger btn-full" style="display:none;" onclick="cancelarEdicion()"> Cancelar edición </button>
</div>
</section>
<!--  ═══ TAB: ALIMENTOS ═══  -->
<section id="tab-db" class="content-section">
<h1 class="page-title">
Base de
<span>Alimentos</span>
</h1>
<div class="card">
<div class="grid-form" style="grid-template-columns: 2fr repeat(3, 1fr);">
<div class="form-group">
<label>Nombre del alimento</label>
<input type="text" id="db-n" placeholder="Ej: pollo cocido"/>
</div>
<div class="form-group">
<label>Proteína (g)</label>
<input type="number" id="db-pro" oninput="previewCal()" placeholder="0"/>
</div>
<div class="form-group">
<label>Carbohidratos (g)</label>
<input type="number" id="db-car" oninput="previewCal()" placeholder="0"/>
</div>
<div class="form-group">
<label>Grasas (g)</label>
<input type="number" id="db-gra" oninput="previewCal()" placeholder="0"/>
</div>
</div>
<p id="cal-preview">
Calorías: 0 kcal
<span style="font-size:13px; color:var(--muted); font-family:'DM Sans',sans-serif; font-weight:400;">por 100 g</span>
</p>
<button class="btn btn-primary" style="margin-top:16px;" onclick="saveIngToDB()"> + Registrar alimento </button>
</div>
<div id="db-list"/>
</section>
<script type="text/javascript">
//
<![CDATA[ let DB_INGREDIENTES = {}; let RECETAS = []; let tempUtensilios = []; let tempPasos = []; let tempIngredientes = []; let editId = null; function inicializarApp() { cargarDeLocalStorage(); actualizarSelects(); renderRecetas(); renderDB(); } function switchTab(id, el) { document.querySelectorAll('.content-section').forEach(s => s.classList.remove('active')); document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active')); document.getElementById(id).classList.add('active'); el.classList.add('active'); } function showToast(msg) { const t = document.getElementById('toast'); t.innerText = msg; t.classList.add('show'); setTimeout(() => t.classList.remove('show'), 3000); } function previewCal() { const p = parseFloat(document.getElementById('db-pro').value) || 0; const c = parseFloat(document.getElementById('db-car').value) || 0; const g = parseFloat(document.getElementById('db-gra').value) || 0; document.getElementById('cal-preview').innerHTML = `${((p*4)+(c*4)+(g*9)).toFixed(1)} kcal <span style="font-size:13px;color:var(--muted);font-family:'DM Sans',sans-serif;font-weight:400;">por 100 g</span>`; } // --- GESTIÓN DB --- function saveIngToDB() { const n = document.getElementById('db-n').value.toLowerCase().trim(); if(!n) return; const p = parseFloat(document.getElementById('db-pro').value) || 0; const c = parseFloat(document.getElementById('db-car').value) || 0; const g = parseFloat(document.getElementById('db-gra').value) || 0; DB_INGREDIENTES[n] = { pro:p, car:c, gra:g, cal: (p*4)+(c*4)+(g*9) }; guardarEnLocalStorage(); actualizarSelects(); renderDB(); showToast("Alimento registrado"); ['db-n','db-pro','db-car','db-gra'].forEach(id => document.getElementById(id).value = ""); document.getElementById('cal-preview').innerHTML = `0 kcal <span style="font-size:13px;color:var(--muted);font-family:'DM Sans',sans-serif;font-weight:400;">por 100 g</span>`; } function renderDB() { const keys = Object.keys(DB_INGREDIENTES).sort(); if(keys.length === 0) { document.getElementById('db-list').innerHTML = ` <div class="empty-state"> <div class="es-icon">&#127822;</div> <p>Aún no has registrado alimentos.<br>Agrega el primero arriba.</p> </div>`; return; } let h = ""; keys.forEach(n => { const i = DB_INGREDIENTES[n]; h += `<div class="db-item"> <div> <span class="db-item-name">${n.charAt(0).toUpperCase()+n.slice(1)}</span> <span class="db-item-kcal"> &mdash; ${i.cal.toFixed(1)} kcal &middot; P:${i.pro}g C:${i.car}g G:${i.gra}g</span> </div> <button class="btn btn-danger btn-sm" onclick="deleteFromDB('${n}')">Eliminar</button> </div>`; }); document.getElementById('db-list').innerHTML = h; } function deleteFromDB(n) { delete DB_INGREDIENTES[n]; guardarEnLocalStorage(); actualizarSelects(); renderDB(); } // --- GESTIÓN RECETAS --- function addToList(id, arr, listId) { const v = document.getElementById(id).value.trim(); if(!v) return; arr.push(v); const tag = listId === 'list-pasos' ? 'li' : 'li'; document.getElementById(listId).innerHTML += `<li>${v}</li>`; document.getElementById(id).value = ""; } function addIngToRecipe() { const n = document.getElementById('r-ing-select').value; const c = parseFloat(document.getElementById('r-ing-cant').value); if(!n || !c) return; tempIngredientes.push({ nombre: n, cant: c }); document.getElementById('list-ingredientes-receta').innerHTML += `<li>${n} — <b>${c}g</b></li>`; } function editarReceta(id) { const r = RECETAS.find(rec => rec.id === id); if(!r) return; editId = id; document.getElementById('form-title').innerHTML = `Editando <span>${r.titulo}</span>`; document.getElementById('r-titulo').value = r.titulo; document.getElementById('r-desc').value = r.desc; tempUtensilios = [...r.utensilios]; tempPasos = [...r.pasos]; tempIngredientes = [...r.ingredientes]; document.getElementById('list-utensilios').innerHTML = tempUtensilios.map(u => `<li>${u}</li>`).join(""); document.getElementById('list-pasos').innerHTML = tempPasos.map(p => `<li>${p}</li>`).join(""); document.getElementById('list-ingredientes-receta').innerHTML = tempIngredientes.map(i => `<li>${i.nombre} — <b>${i.cant}g</b></li>`).join(""); document.getElementById('btn-cancel-edit').style.display = 'flex'; switchTab('tab-create', document.getElementById('btn-create')); } function cancelarEdicion() { editId = null; document.getElementById('form-title').innerHTML = `Nueva <span>Receta</span>`; document.getElementById('btn-cancel-edit').style.display = 'none'; resetForm(); switchTab('tab-view', document.getElementById('btn-view')); } function resetForm() { tempUtensilios = []; tempPasos = []; tempIngredientes = []; ['r-titulo','r-desc','u-nombre','p-nombre'].forEach(id => document.getElementById(id).value = ""); ['list-utensilios','list-pasos','list-ingredientes-receta'].forEach(id => document.getElementById(id).innerHTML = ""); } function guardarReceta() { const t = document.getElementById('r-titulo').value.trim(); if(!t || tempIngredientes.length === 0) return alert("Agrega un título y al menos un ingrediente."); let nut = { p:0, c:0, g:0 }; tempIngredientes.forEach(i => { const info = DB_INGREDIENTES[i.nombre]; const f = i.cant / 100; nut.p += info.pro * f; nut.c += info.car * f; nut.g += info.gra * f; }); const cal = (nut.p*4) + (nut.c*4) + (nut.g*9); const recData = { id: editId || Date.now(), titulo: t, desc: document.getElementById('r-desc').value, utensilios: [...tempUtensilios], pasos: [...tempPasos], ingredientes: [...tempIngredientes], nut: { ...nut, cal } }; if(editId) { const idx = RECETAS.findIndex(r => r.id === editId); RECETAS[idx] = recData; showToast("Receta actualizada ✓"); } else { RECETAS.push(recData); showToast("Receta guardada ✓"); } editId = null; document.getElementById('form-title').innerHTML = `Nueva <span>Receta</span>`; document.getElementById('btn-cancel-edit').style.display = 'none'; guardarEnLocalStorage(); renderRecetas(); resetForm(); switchTab('tab-view', document.getElementById('btn-view')); } function renderRecetas() { const cont = document.getElementById('recipe-list'); if(RECETAS.length === 0) { cont.innerHTML = ` <div class="empty-state"> <div class="es-icon">&#127859;</div> <p>Tu recetario está vacío.<br>¡Crea tu primera receta!</p> </div>`; return; } cont.innerHTML = RECETAS.map(r => ` <div class="card"> <div class="recipe-card-header"> <div> <div class="recipe-title">${r.titulo}</div> <div class="recipe-desc">${r.desc || ''}</div> </div> <div class="recipe-actions"> <button class="btn btn-ghost btn-sm" onclick="editarReceta(${r.id})">&#9998; Editar</button> <button class="btn btn-danger btn-sm" onclick="eliminarReceta(${r.id})">Borrar</button> </div> </div> <div class="macro-row"> <span class="macro-pill pill-cal">&#128293; ${r.nut.cal.toFixed(0)} kcal</span> <span class="macro-pill pill-prot">&#128170; ${r.nut.p.toFixed(1)} g prot</span> <span class="macro-pill pill-carb">&#127838; ${r.nut.c.toFixed(1)} g carb</span> <span class="macro-pill pill-fat">&#129688; ${r.nut.g.toFixed(1)} g gras</span> </div> <div class="recipe-detail"> <div> <h4>Ingredientes</h4> <ul>${r.ingredientes.map(i => `<li>${i.nombre} <span style="color:var(--muted)">(${i.cant}g)</span></li>`).join("")}</ul> ${r.utensilios.length ? `<h4 style="margin-top:16px;">Utensilios</h4><ul>${r.utensilios.map(u => `<li>${u}</li>`).join("")}</ul>` : ''} </div> <div> <h4>Preparación</h4> <ol>${r.pasos.map(p => `<li>${p}</li>`).join("")}</ol> </div> </div> </div> `).join(""); } function eliminarReceta(id) { if(confirm("¿Eliminar esta receta?")) { RECETAS = RECETAS.filter(r => r.id !== id); guardarEnLocalStorage(); renderRecetas(); showToast("Receta eliminada"); } } function descargarXML() { let xml = '<?xml version="1.0" encoding="UTF-8"?>\n<?xml-stylesheet type="text/xsl" href="estilo.xsl"?>\n<recetario>\n'; xml += ' <base_ingredientes>\n'; for(let n in DB_INGREDIENTES) { let i = DB_INGREDIENTES[n]; xml += ` <ingrediente_db nombre="${n}"><calorias>${i.cal}</calorias><proteinas>${i.pro}</proteinas><carbohidratos>${i.car}</carbohidratos><grasas>${i.gra}</grasas></ingrediente_db>\n`; } xml += ' </base_ingredientes>\n <recetas>\n'; RECETAS.forEach(r => { xml += ` <receta>\n <titulo>${r.titulo}</titulo><descripcion>${r.desc}</descripcion>\n`; xml += ` <nutricion><calorias>${r.nut.cal.toFixed(1)}</calorias><proteinas>${r.nut.p.toFixed(1)}</proteinas><carbohidratos>${r.nut.c.toFixed(1)}</carbohidratos><grasas>${r.nut.g.toFixed(1)}</grasas></nutricion>\n`; xml += ` <ingredientes>${r.ingredientes.map(i => `<ingrediente cantidad="${i.cant}g">${i.nombre}</ingrediente>`).join("")}</ingredientes>\n`; xml += ` <utensilios>${r.utensilios.map(u => `<utensilio>${u}</utensilio>`).join("")}</utensilios>\n`; xml += ` <pasos>${r.pasos.map(p => `<paso>${p}</paso>`).join("")}</pasos>\n </receta>\n`; }); xml += ' </recetas>\n</recetario>'; const b = new Blob([xml], {type: 'text/xml'}); const a = document.createElement('a'); a.href = URL.createObjectURL(b); a.download = 'recetas.xml'; a.click(); } function actualizarSelects() { const s = document.getElementById('r-ing-select'); s.innerHTML = Object.keys(DB_INGREDIENTES).sort().map(n => `<option value="${n}">${n.charAt(0).toUpperCase()+n.slice(1)}</option>`).join(""); } function guardarEnLocalStorage() { localStorage.setItem('nutri_v4_db', JSON.stringify(DB_INGREDIENTES)); localStorage.setItem('nutri_v4_recs', JSON.stringify(RECETAS)); } function cargarDeLocalStorage() { const d = localStorage.getItem('nutri_v4_db'); const r = localStorage.getItem('nutri_v4_recs'); if(d) DB_INGREDIENTES = JSON.parse(d); if(r) RECETAS = JSON.parse(r); } function importarXML(input) { const file = input.files[0]; if (!file) return; const reader = new FileReader(); reader.onload = function(e) { try { const parser = new DOMParser(); const xmlDoc = parser.parseFromString(e.target.result, "text/xml"); DB_INGREDIENTES = {}; RECETAS = []; xmlDoc.querySelectorAll('ingrediente_db').forEach(node => { const nombre = node.getAttribute('nombre'); DB_INGREDIENTES[nombre] = { cal: parseFloat(node.querySelector('calorias').textContent), pro: parseFloat(node.querySelector('proteinas').textContent), car: parseFloat(node.querySelector('carbohidratos').textContent), gra: parseFloat(node.querySelector('grasas').textContent) }; }); xmlDoc.querySelectorAll('receta').forEach(node => { const ingredientes = []; node.querySelectorAll('ingrediente').forEach(i => { ingredientes.push({ nombre: i.textContent, cant: parseFloat(i.getAttribute('cantidad')) }); }); RECETAS.push({ id: Date.now() + Math.random(), titulo: node.querySelector('titulo').textContent, desc: node.querySelector('descripcion').textContent, nut: { cal: parseFloat(node.querySelector('nutricion calorias').textContent), p: parseFloat(node.querySelector('nutricion proteinas').textContent), c: parseFloat(node.querySelector('nutricion carbohidratos').textContent), g: parseFloat(node.querySelector('nutricion grasas').textContent) }, ingredientes: ingredientes, utensilios: Array.from(node.querySelectorAll('utensilio')).map(u => u.textContent), pasos: Array.from(node.querySelectorAll('paso')).map(p => p.textContent) }); }); guardarEnLocalStorage(); actualizarSelects(); renderRecetas(); renderDB(); showToast("XML importado con éxito ✓"); } catch (error) { console.error(error); alert("Error al procesar el XML."); } }; reader.readAsText(file); } // ]]>
</script>
</body>
</html>
</xsl:template>
</xsl:stylesheet>