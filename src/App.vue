<template>
  <h2>Fit2Json 转换工具</h2>
  <span>
    <button @click="uploadFile">上传.fit文件</button>
    <button @click="exportJsonData">保存.json结果</button>
  </span>
  <p v-if="uploading">上传中</p>
  <p v-else>{{ data }}</p>
  <pre>&copy;2024 xeonds | fitool</pre>
</template>

<script lang="ts" setup>
import { ref } from 'vue'

const data = ref('')

const uploading = ref(false);
const uploadFile = () => {
  const input = document.createElement('input');
  input.type = 'file';
  input.accept = '.fit';
  input.onchange = async (e) => {
    const file = (e.target as HTMLInputElement).files?.[0];
    if (!file) { return; }
    const formData = new FormData();
    formData.append('file', file);
    try {
      uploading.value = true;
      const response = await fetch('/fit2json', {
        method: 'POST',
        body: formData,
      });
      data.value = await response.json();
    } catch (error) {
      data.value = '上传失败：' + error
    } finally {
      uploading.value = false;
    }
  };
  input.click();
}

const exportJsonData = () => {
  const d = JSON.stringify(data.value);
  const blob = new Blob([d], { type: 'application/json' });
  const url = URL.createObjectURL(blob);
  const a = document.createElement('a');
  a.href = url;
  a.download = 'converted-fit.json';
  a.click();
  URL.revokeObjectURL(url);
}
</script>