<template>
  <div class="flex justify-center items-center bg-[#e0e0e0] min-h-screen font-sans">
    
    <!-- 手机外框 -->
    <div class="w-[393px] h-[852px] bg-[#F2F2F0] shadow-2xl relative flex flex-col overflow-hidden border border-stone-300">
      
      <!-- ==================== 顶部导航栏 (动态变化) ==================== -->
      <header class="pt-12 pb-4 px-6 bg-[#F2F2F0] z-20 border-b border-black/5 flex justify-between items-center transition-all">
        <!-- Home Header -->
        <div v-if="currentTab === 'home'">
          <span class="text-[10px] font-bold tracking-[0.2em] text-stone-400 uppercase">Friday, Jan 16</span>
          <h1 class="text-2xl font-serif font-black text-black">Dashboard</h1>
        </div>
        <!-- Arsenal Header -->
        <div v-if="currentTab === 'arsenal'">
          <span class="text-[10px] font-bold tracking-[0.2em] text-stone-400 uppercase">Knowledge Base</span>
          <h1 class="text-2xl font-serif font-black text-black">The Arsenal</h1>
        </div>
        <!-- Agents Header -->
        <div v-if="currentTab === 'agents'">
          <span class="text-[10px] font-bold tracking-[0.2em] text-stone-400 uppercase">Configuration</span>
          <h1 class="text-2xl font-serif font-black text-black">My Agents</h1>
        </div>
        <!-- Scanner Header -->
        <div v-if="currentTab === 'scan'">
          <span class="text-[10px] font-bold tracking-[0.2em] text-stone-400 uppercase">Analysis Engine</span>
          <h1 class="text-2xl font-serif font-black text-black">Scanner</h1>
        </div>
        
        <!-- 用户头像 / 设置 -->
        <div class="w-8 h-8 rounded-full bg-black text-white flex items-center justify-center font-serif italic border border-black cursor-pointer hover:bg-orange-600 transition-colors">
          M
        </div>
      </header>

      <!-- ==================== 主内容区 ==================== -->
      <main class="flex-1 relative overflow-hidden bg-[#F2F2F0]">
        
        <!-- TAB 1: HOME (Dashboard & Graph) -->
        <div v-if="currentTab === 'home'" class="h-full flex flex-col animate-fade-in">
          
          <!-- 子视图切换器 (Data vs Graph) -->
          <div class="px-6 py-4 flex gap-4">
             <button @click="homeView = 'data'" :class="homeView === 'data' ? 'text-black border-black' : 'text-stone-400 border-transparent'" class="pb-1 border-b-2 text-xs font-bold uppercase tracking-widest transition-all">Overview</button>
             <button @click="homeView = 'graph'" :class="homeView === 'graph' ? 'text-orange-600 border-orange-600' : 'text-stone-400 border-transparent'" class="pb-1 border-b-2 text-xs font-bold uppercase tracking-widest transition-all">Network Graph</button>
          </div>

          <!-- 视图 A: 数据看板 -->
          <div v-if="homeView === 'data'" class="flex-1 overflow-y-auto px-6 pb-6 custom-scrollbar animate-fade-in">
            <!-- 社交能量卡片 -->
            <div class="bg-black text-[#F2F2F0] p-6 mb-8 relative overflow-hidden group">
              <div class="relative z-10">
                <p class="text-[10px] tracking-widest uppercase mb-2 opacity-70">Social Battery</p>
                <div class="flex items-end gap-2">
                  <span class="text-5xl font-serif">82</span>
                  <span class="text-sm mb-2 opacity-70">%</span>
                </div>
                <p class="text-xs mt-4 opacity-80 font-light max-w-[80%] leading-relaxed">"本周高压对话减少了 15%，你的社交防御机制正在生效。"</p>
              </div>
              <div class="absolute -right-6 -bottom-10 w-32 h-32 bg-orange-600 rounded-full blur-3xl opacity-50 group-hover:opacity-80 transition-opacity"></div>
            </div>

            <!-- 最近记录 -->
            <h3 class="text-xs font-bold uppercase tracking-widest mb-4 border-b border-black pb-2">Recent Insights</h3>
            <div class="space-y-3">
              <div v-for="i in 3" :key="i" class="bg-white border border-stone-200 p-4 flex gap-4 hover:border-orange-500 transition-colors cursor-pointer group shadow-sm">
                <div class="w-12 h-12 bg-stone-100 flex items-center justify-center font-serif font-bold text-stone-400 group-hover:text-orange-600 group-hover:bg-orange-50">
                  0{{ i }}
                </div>
                <div>
                  <h4 class="font-bold text-sm">Project Delay Negotiation</h4>
                  <p class="text-[10px] text-stone-500 mt-1">Detected: Defensive | Passive</p>
                </div>
              </div>
            </div>
          </div>

          <!-- 视图 B: 人际关系图谱 (从 Source 2 移植) -->
          <div v-if="homeView === 'graph'" class="flex-1 relative overflow-hidden animate-fade-in bg-stone-100">
             <!-- 背景网格 -->
             <div class="absolute inset-0 opacity-5" style="background-image: radial-gradient(#000 1px, transparent 1px); background-size: 20px 20px;"></div>
             
             <!-- SVG 连线 -->
             <svg class="w-full h-full absolute top-0 left-0 pointer-events-none">
               <line x1="196" y1="300" x2="100" y2="200" stroke="#000" stroke-width="1" stroke-dasharray="4" />
               <line x1="196" y1="300" x2="280" y2="220" stroke="#EA580C" stroke-width="2" />
               <line x1="196" y1="300" x2="150" y2="450" stroke="#000" stroke-width="1" />
             </svg>
             
             <!-- 节点 (ME) -->
             <div class="absolute top-[300px] left-[196px] -translate-x-1/2 -translate-y-1/2 w-14 h-14 bg-black text-white rounded-full flex items-center justify-center border-4 border-[#F2F2F0] z-10 shadow-xl">
               <span class="font-serif italic font-bold">ME</span>
             </div>

             <!-- 节点 (Boss - 可点击) -->
             <div @click="showGraphProfile = true" class="absolute top-[220px] left-[280px] -translate-x-1/2 -translate-y-1/2 cursor-pointer group">
               <div class="w-12 h-12 bg-white border-2 border-orange-600 rounded-full flex items-center justify-center shadow-md group-hover:scale-110 transition-transform relative">
                 <span class="font-serif font-bold text-xs">Boss</span>
                 <div class="absolute -top-1 -right-1 w-4 h-4 bg-orange-600 rounded-full flex items-center justify-center text-[8px] text-white animate-pulse">!</div>
               </div>
             </div>
             
             <!-- 悬浮数据 -->
             <div class="absolute bottom-6 left-6 right-6 bg-white border border-black p-4 shadow-[4px_4px_0px_0px_rgba(0,0,0,1)]">
                <div class="flex justify-between items-end">
                  <div>
                    <p class="text-[9px] uppercase tracking-widest text-stone-400">Status</p>
                    <p class="text-lg font-serif font-bold text-orange-600">High Friction</p>
                  </div>
                  <div class="text-right">
                    <p class="text-[9px] uppercase tracking-widest text-stone-400">Risk Nodes</p>
                    <p class="text-lg font-mono">1/5</p>
                  </div>
                </div>
             </div>
          </div>
        </div>

        <!-- TAB 2: ARSENAL (话术库 - 从 Source 2 移植) -->
        <div v-if="currentTab === 'arsenal'" class="h-full overflow-y-auto px-6 py-6 custom-scrollbar animate-fade-in">
           <!-- 搜索框 -->
           <div class="relative mb-6">
             <input type="text" placeholder="Search scenarios..." class="w-full h-12 bg-white border border-black px-4 text-sm font-serif placeholder:italic focus:outline-none focus:ring-2 focus:ring-orange-600 transition-all">
             <svg class="w-4 h-4 absolute right-4 top-4 text-stone-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/></svg>
           </div>
           
           <!-- 瀑布流内容 -->
           <div class="grid grid-cols-1 gap-5 pb-20">
             <div class="bg-white border border-black p-5 shadow-[4px_4px_0px_0px_#ea580c] hover:-translate-y-1 transition-transform cursor-pointer">
               <div class="flex justify-between items-start mb-3">
                 <span class="bg-stone-100 text-stone-500 px-2 py-1 text-[9px] uppercase font-bold tracking-wider">Salary</span>
               </div>
               <h3 class="font-serif font-bold text-lg leading-tight mb-2">The "Inflation" Defense</h3>
               <p class="text-xs text-stone-600 mb-4 leading-relaxed">用于在年度考核中委婉提出加薪，侧重于市场价值而非个人苦劳。</p>
               <button class="w-full border border-black py-2 text-[10px] font-bold uppercase hover:bg-black hover:text-white transition-colors">Copy Template</button>
             </div>

             <div class="bg-white border border-stone-200 p-5 hover:border-black transition-colors cursor-pointer">
               <div class="flex justify-between items-start mb-3">
                 <span class="bg-stone-100 text-stone-500 px-2 py-1 text-[9px] uppercase font-bold tracking-wider">Refusal</span>
               </div>
               <h3 class="font-serif font-bold text-lg leading-tight mb-2">Polite Decline (Overtime)</h3>
               <p class="text-xs text-stone-600 mb-4 leading-relaxed">当领导在非工作时间派活时，如何不卑不亢地拒绝。</p>
             </div>
           </div>
        </div>

        <!-- TAB 3: AGENTS (配置) -->
        <div v-if="currentTab === 'agents'" class="h-full overflow-y-auto px-6 py-6 custom-scrollbar animate-fade-in">
           <p class="text-xs text-stone-500 mb-6 leading-relaxed">配置你的 AI 顾问团队。激活多个智能体将启用“圆桌会议”模式 (CoT enabled)。</p>
           
           <div class="space-y-4">
             <!-- Agent 1 -->
             <div class="border border-black bg-white p-5 relative">
               <div class="flex justify-between items-start mb-3">
                 <div class="flex gap-3 items-center">
                   <div class="w-10 h-10 bg-orange-100 text-orange-600 flex items-center justify-center rounded-full">
                     <span class="font-serif font-bold">S.</span>
                   </div>
                   <div>
                     <h3 class="font-bold text-sm">The Strategist</h3>
                     <p class="text-[10px] text-stone-400 uppercase tracking-widest">Logic Core</p>
                   </div>
                 </div>
                 <div class="w-10 h-5 bg-black rounded-full relative cursor-pointer"><div class="w-3 h-3 bg-white rounded-full absolute top-1 right-1"></div></div>
               </div>
               <p class="text-xs text-stone-600">分析利益冲突，提供博弈论视角的回复建议。</p>
             </div>
             
             <!-- Agent 2 -->
             <div class="border border-stone-200 bg-stone-50 p-5 relative opacity-80 hover:opacity-100 transition">
               <div class="flex justify-between items-start mb-3">
                 <div class="flex gap-3 items-center">
                   <div class="w-10 h-10 bg-stone-200 text-stone-500 flex items-center justify-center rounded-full">
                     <span class="font-serif font-bold">E.</span>
                   </div>
                   <div>
                     <h3 class="font-bold text-sm">Empathizer</h3>
                     <p class="text-[10px] text-stone-400 uppercase tracking-widest">Psychology</p>
                   </div>
                 </div>
                 <div class="w-10 h-5 bg-stone-300 rounded-full relative cursor-pointer"><div class="w-3 h-3 bg-white rounded-full absolute top-1 left-1"></div></div>
               </div>
               <p class="text-xs text-stone-600">分析情感潜台词，识别微情绪变化。</p>
             </div>
           </div>
        </div>

        <!-- TAB 4: SCANNER (核心功能 + CoT View) -->
        <div v-if="currentTab === 'scan'" class="h-full flex flex-col animate-fade-in">
           
           <!-- 状态 A: 上传前 -->
           <div v-if="!hasResult" class="flex-1 flex flex-col items-center justify-center p-6 text-center">
             <div @click="startAnalysis" class="w-64 h-64 border-2 border-dashed border-stone-300 rounded-full flex flex-col items-center justify-center hover:border-orange-500 hover:bg-orange-50 transition-all cursor-pointer group relative">
               <div v-if="!isAnalyzing" class="flex flex-col items-center">
                 <span class="text-4xl font-thin mb-2 group-hover:scale-110 transition">+</span>
                 <span class="text-xs font-bold tracking-widest uppercase">Upload Screenshot</span>
               </div>
               <div v-else class="absolute inset-0 rounded-full border-t-2 border-orange-600 animate-spin"></div>
             </div>
             <p v-if="isAnalyzing" class="mt-8 text-xs font-mono animate-pulse text-orange-600">Initializing Multi-Agent Workflow...</p>
           </div>

           <!-- 状态 B: 分析结果 -->
           <div v-if="hasResult" class="flex-1 overflow-y-auto bg-white relative">
              <!-- 顶部：CoT 切换按钮 -->
              <button @click="showCoT = !showCoT" class="absolute top-4 right-4 z-20 bg-black/80 backdrop-blur text-white px-3 py-1 text-[9px] font-bold uppercase tracking-widest rounded hover:bg-orange-600 transition-colors">
                {{ showCoT ? 'Hide System Log' : 'View System Log' }}
              </button>

              <!-- CoT 覆盖层 (技术展示) -->
              <div v-if="showCoT" class="absolute inset-0 bg-stone-900 z-10 p-6 font-mono text-xs overflow-y-auto custom-scrollbar animate-slide-in-right">
                <p class="text-stone-500 border-b border-stone-700 pb-2 mb-4">SYSTEM_DIAGNOSTICS_V1.0</p>
                <div class="space-y-4 text-stone-300">
                   <p>> [INPUT] Image dimensions 1024x2048</p>
                   <p>> [OCR] Text extraction complete. Confidence: 98%</p>
                   <p class="text-orange-400">> [AGENT: PSYCH] Detecting passive-aggressive markers...</p>
                   <p class="pl-4 italic text-stone-500">"Phrase detected: 'I thought you knew' -> Blame shifting."</p>
                   <p class="text-green-400">> [AGENT: STRATEGIST] Generating 3 counter-moves.</p>
                   <p>> [OUTPUT] JSON object constructed.</p>
                </div>
              </div>

              <!-- 正常结果展示 -->
              <div class="h-[200px] w-full bg-stone-200 overflow-hidden relative">
                <img src="https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?q=80&w=3376&auto=format&fit=crop" class="w-full h-full object-cover grayscale opacity-50">
                <div class="absolute bottom-4 left-6 bg-orange-600 text-white px-2 py-1 text-[10px] font-bold uppercase">Analysis Complete</div>
              </div>
              
              <div class="p-6">
                <h2 class="text-3xl font-serif font-bold mb-2">"Deflective"</h2>
                <div class="flex gap-2 mb-4">
                   <span class="border border-black px-2 py-0.5 text-[9px] font-bold uppercase">Risk: High</span>
                   <span class="border border-stone-300 text-stone-400 px-2 py-0.5 text-[9px] font-bold uppercase">Confidence: 92%</span>
                </div>
                <p class="text-sm text-stone-600 mb-6 leading-relaxed">对方试图通过模糊时间节点来转移话题。建议采用“封闭式提问”锁定结果，避免陷入拉锯战。</p>
                
                <!-- 策略卡片 -->
                <div class="bg-stone-50 border border-stone-200 p-4 mb-4">
                  <div class="flex justify-between items-center mb-2">
                    <span class="text-[10px] font-bold uppercase text-orange-600">Recommended Strategy</span>
                  </div>
                  <p class="text-sm font-serif italic mb-4">"关于时间节点，我们需要在周三前敲定，否则会影响Q4的整体排期。"</p>
                  
                  <!-- 模拟演练按钮 -->
                  <button @click="showSim = true" class="w-full py-3 bg-black text-white text-xs font-bold uppercase hover:bg-orange-600 transition-colors flex items-center justify-center gap-2 shadow-lg">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15a2 2 0 01-2 2H7l-4 4V5a2 2 0 012-2h14a2 2 0 012 2z"/></svg>
                    Enter Simulator
                  </button>
                </div>
              </div>
           </div>

           <!-- 模拟弹窗 Modal -->
           <div v-if="showSim" class="absolute inset-0 bg-white z-50 flex flex-col animate-slide-up">
             <div class="p-4 border-b border-stone-100 flex justify-between items-center bg-[#F2F2F0]">
               <span class="text-xs font-bold uppercase tracking-widest">Live Simulation</span>
               <button @click="showSim = false" class="text-xl hover:text-orange-600 transition-colors">&times;</button>
             </div>
             <div class="flex-1 bg-stone-100 p-4 space-y-4 overflow-y-auto">
               <div class="flex gap-2">
                 <div class="w-8 h-8 bg-stone-300 rounded-full flex-shrink-0"></div>
                 <div class="bg-white p-3 text-sm rounded-tr-xl rounded-br-xl rounded-bl-xl shadow-sm max-w-[80%]">这就是你所谓的紧急方案？我觉得还需要再议。</div>
               </div>
               <div class="flex gap-2 justify-end">
                 <div class="bg-black text-white p-3 text-sm rounded-tl-xl rounded-bl-xl rounded-br-xl shadow-sm max-w-[80%]">关于时间节点，我们需要在周三前敲定...</div>
                 <div class="w-8 h-8 bg-orange-600 rounded-full flex-shrink-0"></div>
               </div>
               <div class="text-center animate-fade-in">
                  <span class="bg-orange-100 text-orange-600 text-[10px] font-bold px-3 py-1 rounded-full border border-orange-200">AI: 压迫感过强 (7/10)，对方可能产生抵触</span>
               </div>
             </div>
             <div class="p-4 bg-white border-t border-stone-200">
                <div class="h-10 bg-stone-50 border border-stone-200 rounded px-3 flex items-center text-xs text-stone-400">Type your reply...</div>
             </div>
           </div>
        </div>

      </main>

      <!-- ==================== 底部导航栏 ==================== -->
      <nav class="h-20 bg-[#F2F2F0] border-t border-black/5 flex justify-around items-center px-2 pb-2 z-30">
        <!-- Home Tab -->
        <button @click="currentTab = 'home'" class="flex flex-col items-center p-2 group w-16">
          <svg class="w-6 h-6 mb-1 transition-colors" :class="currentTab === 'home' ? 'text-orange-600' : 'text-stone-400'" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"/></svg>
          <span class="text-[9px] font-bold uppercase tracking-widest transition-colors" :class="currentTab === 'home' ? 'text-black' : 'text-stone-400'">Home</span>
        </button>
        
        <!-- Arsenal Tab -->
        <button @click="currentTab = 'arsenal'" class="flex flex-col items-center p-2 group w-16">
          <svg class="w-6 h-6 mb-1 transition-colors" :class="currentTab === 'arsenal' ? 'text-orange-600' : 'text-stone-400'" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"/></svg>
          <span class="text-[9px] font-bold uppercase tracking-widest transition-colors" :class="currentTab === 'arsenal' ? 'text-black' : 'text-stone-400'">Lib</span>
        </button>

        <!-- Scanner Tab (Floating) -->
        <button @click="currentTab = 'scan'" class="relative -top-6">
          <div class="w-14 h-14 bg-black text-white flex items-center justify-center shadow-xl hover:bg-orange-600 transition-colors transform hover:scale-105 rounded-xl border-2 border-[#F2F2F0]">
             <svg width="24" height="24" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-width="2" d="M3 9a2 2 0 012-2h.93a2 2 0 001.664-.89l.812-1.22A2 2 0 0110.07 4h3.86a2 2 0 011.664.89l.812 1.22A2 2 0 0018.07 7H19a2 2 0 012 2v9a2 2 0 01-2 2H5a2 2 0 01-2-2V9z"/><path stroke-width="2" d="M15 13a3 3 0 11-6 0 3 3 0 016 0z"/></svg>
          </div>
        </button>

        <!-- Agents Tab -->
        <button @click="currentTab = 'agents'" class="flex flex-col items-center p-2 group w-16">
          <svg class="w-6 h-6 mb-1 transition-colors" :class="currentTab === 'agents' ? 'text-orange-600' : 'text-stone-400'" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"/></svg>
          <span class="text-[9px] font-bold uppercase tracking-widest transition-colors" :class="currentTab === 'agents' ? 'text-black' : 'text-stone-400'">Agents</span>
        </button>
        
        <!-- Placeholder for symmetry or Profile -->
        <button class="flex flex-col items-center p-2 group w-16 opacity-30 cursor-not-allowed">
           <div class="w-6 h-6 rounded-full border border-stone-400 mb-1"></div>
           <span class="text-[9px] font-bold uppercase tracking-widest text-stone-400">Me</span>
        </button>
      </nav>

      <!-- 侧边栏档案 (Graph Profile) - 点击图谱节点触发 -->
      <div v-if="showGraphProfile" class="absolute inset-0 bg-black/20 backdrop-blur-sm z-50 animate-fade-in" @click="showGraphProfile = false">
         <div class="absolute right-0 top-0 bottom-0 w-[85%] bg-[#F2F2F0] border-l border-black shadow-2xl p-6 overflow-y-auto animate-slide-in-right" @click.stop>
            <div class="flex justify-between items-start mb-6">
               <div class="w-16 h-16 bg-orange-600 text-white flex items-center justify-center text-2xl font-serif border border-black shadow-md">B.</div>
               <button @click="showGraphProfile = false" class="text-2xl hover:text-orange-600">&times;</button>
            </div>
            <h2 class="text-3xl font-serif font-black mb-1">Direct Manager</h2>
            <p class="text-xs font-mono text-stone-500 mb-6">ID: #WORK-001 | High Friction</p>
            <div class="space-y-6">
               <div class="border-t border-black pt-2">
                 <p class="text-[9px] uppercase tracking-widest mb-2">Psychological Profile</p>
                 <div class="flex flex-wrap gap-2">
                    <span class="border border-black px-2 py-1 text-[10px] uppercase font-bold bg-white">Dominant</span>
                    <span class="border border-orange-600 text-orange-600 px-2 py-1 text-[10px] uppercase font-bold bg-orange-50">Narcissistic</span>
                 </div>
               </div>
               <div class="border-t border-black pt-2">
                  <p class="text-[9px] uppercase tracking-widest mb-2">AI Recommendation</p>
                  <p class="font-serif italic text-lg leading-tight">"书面留痕。避免口头承诺，所有指令要求对方邮件确认。"</p>
               </div>
            </div>
         </div>
      </div>

    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue';

// Navigation State
const currentTab = ref('home');
const homeView = ref('data'); // 'data' or 'graph'

// Analysis State
const isAnalyzing = ref(false);
const hasResult = ref(false);
const showSim = ref(false);
const showCoT = ref(false);

// Graph State
const showGraphProfile = ref(false);

const startAnalysis = () => {
  isAnalyzing.value = true;
  // Reset previous states
  hasResult.value = false;
  showCoT.value = false;
  
  // Simulation of delay
  setTimeout(() => {
    isAnalyzing.value = false;
    hasResult.value = true;
  }, 2000);
};
</script>

<style scoped>
.font-serif { font-family: 'Playfair Display', serif; }

/* 动画工具类 */
.animate-fade-in { animation: fadeIn 0.4s ease-out; }
@keyframes fadeIn { from { opacity: 0; } to { opacity: 1; } }

.animate-slide-up { animation: slideUp 0.3s cubic-bezier(0.16, 1, 0.3, 1); }
@keyframes slideUp { from { transform: translateY(100%); } to { transform: translateY(0); } }

.animate-slide-in-right { animation: slideInRight 0.3s cubic-bezier(0.16, 1, 0.3, 1); }
@keyframes slideInRight { from { transform: translateX(100%); } to { transform: translateX(0); } }

.custom-scrollbar::-webkit-scrollbar { width: 0px; }
</style>