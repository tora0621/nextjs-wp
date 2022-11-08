/** @type {import('next').NextConfig} */

const path = require('path');

const nextConfig = {
  reactStrictMode: true,
  sassOptions: {
    includePaths: [path.join(__dirname, 'styles')],
  },
  //外部から画像を読み込む場合ココにドメインを指定,ref:https://nextjs.org/docs/basic-features/image-optimization#domains
  // images: {
  //   domains: ['placekitten.com'],
  // },
};

module.exports = nextConfig;
