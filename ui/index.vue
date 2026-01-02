<template>
  <div class="flex justify-center items-center bg-[#e0e0e0] min-h-screen font-sans">
    
    <!-- 手机外框 -->
    <div class="w-[393px] h-[852px] bg-[#F2F2F0] shadow-2xl relative flex flex-col overflow-hidden border border-stone-300">
      
      <!-- ==================== 顶部导航栏 ==================== -->
      <header class="pt-12 pb-4 px-6 bg-[#F2F2F0] z-20 border-b border-black/5 flex justify-between items-center">
        <div v-if="currentTab === 'home'">
          <span class="text-[10px] font-bold tracking-[0.2em] text-stone-400 uppercase">Friday, Jan 2</span>
          <h1 class="text-2xl font-serif font-black text-black">Dashboard</h1>
        </div>
        <div v-if="currentTab === 'agents'">
          <span class="text-[10px] font-bold tracking-[0.2em] text-stone-400 uppercase">Configuration</span>
          <h1 class="text-2xl font-serif font-black text-black">My Agents</h1>
        </div>
        <div v-if="currentTab === 'scan'">
          <span class="text-[10px] font-bold tracking-[0.2em] text-stone-400 uppercase">Analysis</span>
          <h1 class="text-2xl font-serif font-black text-black">Scanner</h1>
        </div>
        
        <!-- 用户头像 -->
        <div class="w-8 h-8 rounded-full bg-black text-white flex items-center justify-center font-serif italic border border-black">M</div>
      </header>

      <!-- ==================== 主内容区 (根据 Tab 切换) ==================== -->
      <main class="flex-1 relative overflow-hidden bg-[#F2F2F0]">
        
        <!-- TAB 1: DASHBOARD (首页) -->
        <div v-if="currentTab === 'home'" class="h-full overflow-y-auto px-6 py-6 custom-scrollbar animate-fade-in">
          <!-- 社交能量卡片 -->
          <div class="bg-black text-[#F2F2F0] p-6 mb-8 relative overflow-hidden">
            <div class="relative z-10">
              <p class="text-[10px] tracking-widest uppercase mb-2 opacity-70">Social Battery</p>
              <div class="flex items-end gap-2">
                <span class="text-5xl font-serif">82</span>
                <span class="text-sm mb-2 opacity-70">%</span>
              </div>
              <p class="text-xs mt-4 opacity-80 font-light max-w-[80%]">"你本周处理了 5 次高压对话，建议周末开启勿扰模式。"</p>
            </div>
            <!-- 装饰背景 -->
            <div class="absolute -right-6 -bottom-10 w-32 h-32 bg-orange-600 rounded-full blur-3xl opacity-50"></div>
          </div>

          <!-- 最近记录 (History) -->
          <h3 class="text-xs font-bold uppercase tracking-widest mb-4 border-b border-black pb-2">Recent Insights</h3>
          <div class="space-y-3">
            <div v-for="i in 3" :key="i" class="bg-white border border-stone-200 p-4 flex gap-4 hover:border-orange-500 transition-colors cursor-pointer group">
              <div class="w-12 h-12 bg-stone-100 flex items-center justify-center font-serif font-bold text-stone-400 group-hover:text-orange-600 group-hover:bg-orange-50">
                {{ i }}
              </div>
              <div>
                <h4 class="font-bold text-sm">Project Delay Negotiation</h4>
                <p class="text-[10px] text-stone-500 mt-1">Detected: Defensive | Passive</p>
              </div>
            </div>
          </div>
        </div>

        <!-- TAB 2: AGENTS (多智能体配置) -->
        <div v-if="currentTab === 'agents'" class="h-full overflow-y-auto px-6 py-6 custom-scrollbar animate-fade-in">
          <p class="text-xs text-stone-500 mb-6 leading-relaxed">
            激活不同的智能体以应对不同场景。多智能体协作会增加分析耗时，但能提供更精准的策略。
          </p>

          <div class="space-y-4">
            <!-- Agent Card 1 -->
            <div class="border border-black bg-white p-5 relative">
              <div class="flex justify-between items-start mb-3">
                <div class="flex gap-3 items-center">
                  <div class="w-10 h-10 bg-orange-100 text-orange-600 flex items-center justify-center rounded-full">
                    <svg width="20" height="20" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M12 14l9-5-9-5-9 5 9 5z"/><path d="M12 14l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14z"/></svg>
                  </div>
                  <div>
                    <h3 class="font-bold text-sm">The Strategist</h3>
                    <p class="text-[10px] text-stone-400 uppercase tracking-widest">Core Agent</p>
                  </div>
                </div>
                <!-- Toggle Switch -->
                <div class="w-10 h-5 bg-black rounded-full relative cursor-pointer">
                  <div class="w-3 h-3 bg-white rounded-full absolute top-1 right-1"></div>
                </div>
              </div>
              <p class="text-xs text-stone-600">分析利益冲突，提供博弈论视角的回复建议。</p>
            </div>

            <!-- Agent Card 2 -->
            <div class="border border-stone-200 bg-stone-50 p-5 relative opacity-70 hover:opacity-100 transition">
              <div class="flex justify-between items-start mb-3">
                <div class="flex gap-3 items-center">
                  <div class="w-10 h-10 bg-stone-200 text-stone-500 flex items-center justify-center rounded-full">
                    <svg width="20" height="20" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"/></svg>
                  </div>
                  <div>
                    <h3 class="font-bold text-sm">Empathizer</h3>
                    <p class="text-[10px] text-stone-400 uppercase tracking-widest">Psychology</p>
                  </div>
                </div>
                <div class="w-10 h-5 bg-stone-300 rounded-full relative cursor-pointer">
                  <div class="w-3 h-3 bg-white rounded-full absolute top-1 left-1"></div>
                </div>
              </div>
              <p class="text-xs text-stone-600">分析情感潜台词，识别微情绪变化。</p>
            </div>
          </div>
        </div>

        <!-- TAB 3: SCANNER (分析与模拟) -->
        <div v-if="currentTab === 'scan'" class="h-full flex flex-col animate-fade-in">
          
          <!-- 上传区/结果区 切换 -->
          <div v-if="!hasResult" class="flex-1 flex flex-col items-center justify-center p-6 text-center">
            <div @click="startAnalysis" class="w-64 h-64 border-2 border-dashed border-stone-300 rounded-full flex flex-col items-center justify-center hover:border-orange-500 hover:bg-orange-50 transition-all cursor-pointer group relative">
              <div v-if="!isAnalyzing" class="flex flex-col items-center">
                <span class="text-4xl font-thin mb-2 group-hover:scale-110 transition">+</span>
                <span class="text-xs font-bold tracking-widest uppercase">Upload Chat</span>
              </div>
              <!-- Loading State -->
              <div v-else class="absolute inset-0 rounded-full border-t-2 border-orange-600 animate-spin"></div>
            </div>
            <p v-if="isAnalyzing" class="mt-8 text-xs font-mono animate-pulse">Running Multi-Agent Workflow...</p>
          </div>

          <!-- 结果详情页 (包含模拟功能) -->
          <div v-if="hasResult" class="flex-1 overflow-y-auto bg-white relative">
             <div class="h-[200px] w-full bg-stone-200 overflow-hidden relative">
               <img src="https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?q=80&w=3376&auto=format&fit=crop" class="w-full h-full object-cover grayscale opacity-50">
               <div class="absolute bottom-4 left-6 bg-orange-600 text-white px-2 py-1 text-[10px] font-bold uppercase">Analysis Complete</div>
             </div>
             
             <div class="p-6">
               <h2 class="text-2xl font-serif font-bold mb-4">"Deflective"</h2>
               <p class="text-sm text-stone-600 mb-6">对方试图通过模糊时间节点来转移话题。建议采用“封闭式提问”锁定结果。</p>
               
               <!-- 功能标签页 -->
               <div class="flex border-b border-stone-200 mb-6">
                 <button class="pb-2 border-b-2 border-black text-xs font-bold mr-6">Strategy</button>
                 <button class="pb-2 text-stone-400 text-xs font-bold hover:text-black">Raw Data</button>
               </div>

               <!-- 策略卡片 -->
               <div class="bg-stone-50 border border-stone-200 p-4 mb-4">
                 <div class="flex justify-between items-center mb-2">
                   <span class="text-[10px] font-bold uppercase text-orange-600">Recommended</span>
                 </div>
                 <p class="text-sm font-serif italic mb-4">"关于时间节点，我们需要在周三前敲定，否则会影响Q4的整体排期。"</p>
                 
                 <!-- 模拟按钮 (User Wanted Feature) -->
                 <button @click="showSim = true" class="w-full py-3 bg-black text-white text-xs font-bold uppercase hover:bg-orange-600 transition-colors flex items-center justify-center gap-2">
                   <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15a2 2 0 01-2 2H7l-4 4V5a2 2 0 012-2h14a2 2 0 012 2z"/></svg>
                   Simulate Reply
                 </button>
               </div>
             </div>
          </div>
          
          <!-- 模拟演练 弹窗 (Modal) -->
          <div v-if="showSim" class="absolute inset-0 bg-white z-50 flex flex-col animate-slide-up">
            <div class="p-4 border-b border-stone-100 flex justify-between items-center bg-[#F2F2F0]">
              <span class="text-xs font-bold uppercase tracking-widest">Simulation Mode</span>
              <button @click="showSim = false" class="text-xl">&times;</button>
            </div>
            <div class="flex-1 bg-stone-100 p-4 space-y-4">
              <!-- AI 模拟对方 -->
              <div class="flex gap-2">
                <div class="w-8 h-8 bg-stone-300 rounded-full flex-shrink-0"></div>
                <div class="bg-white p-3 text-sm rounded-tr-xl rounded-br-xl rounded-bl-xl shadow-sm max-w-[80%]">
                  这就是你所谓的紧急方案？我觉得还需要再议。
                </div>
              </div>
              <!-- 用户尝试 -->
              <div class="flex gap-2 justify-end">
                <div class="bg-black text-white p-3 text-sm rounded-tl-xl rounded-bl-xl rounded-br-xl shadow-sm max-w-[80%]">
                  关于时间节点，我们需要在周三前敲定...
                </div>
                <div class="w-8 h-8 bg-orange-600 rounded-full flex-shrink-0"></div>
              </div>
              <!-- AI 实时反馈 -->
              <div class="text-center">
                 <span class="bg-orange-100 text-orange-600 text-[10px] font-bold px-2 py-1 rounded-full">AI: 压迫感过强，对方可能产生抵触</span>
              </div>
            </div>
            <!-- 输入框 -->
            <div class="p-4 bg-white border-t border-stone-200">
               <div class="h-10 bg-stone-50 border border-stone-200 rounded px-3 flex items-center text-xs text-stone-400">
                 Type your reply to practice...
               </div>
            </div>
          </div>

        </div>

      </main>

      <!-- ==================== 底部导航栏 ==================== -->
      <nav class="h-20 bg-[#F2F2F0] border-t border-black/5 flex justify-around items-center px-2 pb-2">
        <button @click="currentTab = 'home'" class="flex flex-col items-center p-2 group">
          <svg class="w-6 h-6 mb-1 transition-colors" :class="currentTab === 'home' ? 'text-orange-600' : 'text-stone-400'" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"/></svg>
          <span class="text-[9px] font-bold uppercase tracking-widest" :class="currentTab === 'home' ? 'text-black' : 'text-stone-400'">Home</span>
        </button>
        
        <!-- 中间突出的 Scanner 按钮 -->
        <button @click="currentTab = 'scan'" class="relative -top-6">
          <div class="w-14 h-14 bg-black text-white flex items-center justify-center shadow-xl hover:bg-orange-600 transition-colors transform hover:scale-105 rounded-xl">
             <svg width="24" height="24" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-width="2" d="M3 9a2 2 0 012-2h.93a2 2 0 001.664-.89l.812-1.22A2 2 0 0110.07 4h3.86a2 2 0 011.664.89l.812 1.22A2 2 0 0018.07 7H19a2 2 0 012 2v9a2 2 0 01-2 2H5a2 2 0 01-2-2V9z"/><path stroke-width="2" d="M15 13a3 3 0 11-6 0 3 3 0 016 0z"/></svg>
          </div>
        </button>

        <button @click="currentTab = 'agents'" class="flex flex-col items-center p-2 group">
          <svg class="w-6 h-6 mb-1 transition-colors" :class="currentTab === 'agents' ? 'text-orange-600' : 'text-stone-400'" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"/></svg>
          <span class="text-[9px] font-bold uppercase tracking-widest" :class="currentTab === 'agents' ? 'text-black' : 'text-stone-400'">Agents</span>
        </button>
      </nav>

    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue';

const currentTab = ref('home');
const isAnalyzing = ref(false);
const hasResult = ref(false);
const showSim = ref(false);

const startAnalysis = () => {
  isAnalyzing.value = true;
  setTimeout(() => {
    isAnalyzing.value = false;
    hasResult.value = true;
  }, 2000);
};
</script>

<style scoped>
/* 隐藏滚动条 */
.custom-scrollbar::-webkit-scrollbar { display: none; }
.custom-scrollbar { -ms-overflow-style: none; scrollbar-width: none; }

/* 动画定义 */
.animate-fade-in { animation: fadeIn 0.4s ease-out; }
@keyframes fadeIn { from { opacity: 0; } to { opacity: 1; } }

.animate-slide-up { animation: slideUp 0.3s cubic-bezier(0.16, 1, 0.3, 1); }
@keyframes slideUp { from { transform: translateY(100%); } to { transform: translateY(0); } }

.font-serif { font-family: 'Playfair Display', serif; }
</style>