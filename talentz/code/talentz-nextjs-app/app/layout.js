import { Inter } from 'next/font/google'
import './globals.css'

const inter = Inter({ subsets: ['latin'] })

export const metadata = {
  title: 'Talentz',
  description: 'Find Talend',
}

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body className={inter.className + "bg-blue-200"}>{children}</body>
    </html>
  )
}
