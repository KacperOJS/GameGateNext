import './globals.css'
import 'react-lazy-load-image-component/src/effects/blur.css';

import Image from 'next/image'
import type { Metadata } from 'next'
import { Inter } from 'next/font/google'
const inter = Inter({ subsets: ['latin'] })

import { Toaster } from "@/components/ui/toaster"
import { Provider } from '@/providers/providers'
import { Button } from '@/components/ui/button'
import Link from 'next/link'
import MainMenu from '@/components/main-menu'
import { ScrollArea } from '@/components/ui/scroll-area'

import LoginBox from '@/components/login-box'
import configLua from '@/hooks/configLua'
import RashidBox from '@/components/rashid-box'
import CountDown from '@/components/count-down'
import { StatusServer } from '@/utils/statusServer'
import { Typography } from '@/components/Typography'
import { prisma } from '@/lib/prisma'
import { Badge } from '@/components/ui/badge'
import { IconiFy } from '@/components/Iconify';
import Boosted from '@/components/aimations/boosted';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';

const lua = configLua()

export const revalidate = 0

export const metadata: Metadata = {
  title: {
    default: lua['serverName'],
    template: `%s - ${lua['serverName']}`,
  }
}

export async function status() {
  try {
    const statusServer = new StatusServer();
    const host = lua['ip']
    const port = +lua['statusProtocolPort'];
    const status = await statusServer.getStatus(host, port);
    return {
      status: !!status,
    };
  } catch (error) {
    console.error('Ocorreu um erro ao verificar o status do servidor:', error);
    return {
      status: false,
    };
  }
}

async function boostedBoss() {

}

export async function totalOnline() {
  try {
    const som = await prisma.players_online.count()
    return som
  } catch (error) {
    console.error('Ocorreu um erro ao contar o toral de players online:', error);
    return 0
  }
}

function extractIdsFromArrayOfObjects(array: any) {
  function extractIdFromUrl(url: string) {
    const match = url.match(/id=(\d+)/);
    return match ? match[1] : null;
  }

  function extractIdsFromObject(obj: any) {
    const id = extractIdFromUrl(obj.value);
    return { id, config: obj.config };
  }

  return array.map(extractIdsFromObject);
}


async function getSeverConfig(value: string) {
  const array1 = await prisma.$queryRaw<{ config: string, value: string }>`SELECT * from server_config WHERE config = ${value}`

  return extractIdsFromArrayOfObjects(array1);

}
export default async function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {

  const statusServer = await status()
  const countOnline = await totalOnline()

  const boostedCreature = await getSeverConfig('boost_monster_url')
  const boostedBoss = await getSeverConfig('boost_boss_url')


  return (
    <html lang="en">
      <body className={inter.className} suppressHydrationWarning >
        <>
          <Provider>
             {/* <video className="fixed top-0 left-0 min-w-full min-h-full -z-1 object-cover" autoPlay muted playsInline loop>
              <source src="/movies/logo.webm" type="video/webm" />
            </video>  */}
            <ScrollArea className="h-screen w-full px-2">
              <div className='sm:grid sm:grid-cols-12 sm:space-x-2 sm:space-y-0 space-y-2 grid-cols-1 mx-auto max-w-screen-xl mt-10 hidden'>
                <div className='col-span-2 space-y-2' >
{/* 
                <Link href="/">
                    <Image src={'/testlogo2.png'} priority width={212} height={200} className='w-auto h-auto' alt='Logo' />
                  </Link>  */}
                </div>
                <div className='col-span-8 space-y-2'>
                  <div className='flex justify-center items-center'>
				  <Link href="/">
					<div className="animated-image">
						<img src="/movies/worldofshinobi.png"/>
					</div>
				</Link>
                  </div>
                </div>

                <div className='sm:col-span-2 col-span-1 hidden sm:block gap-2'>
                  {/* <div className='flex flex-row justify-center items-end h-full pb-2 gap-2'>
                    <div className='bg-background/10 shadow rounded-sm backdrop-blur-[6px] p-3'>
                      <Boosted boosted={{
                        boostname: boostedCreature[0].id,
                        lookaddons: 0,
                        lookbody: 0,
                        lookfeet: 0,
                        lookhead: 0,
                        looklegs: 0,
                        lookmount: 0,
                        looktype: boostedCreature[0].id
                      }} kind="creature" />
                    </div>
                    <div className='bg-background/10 shadow rounded-sm backdrop-blur-[6px] p-3'>
                      <Boosted boosted={{
                        boostname: boostedBoss[0].id,
                        lookaddons: 0,
                        lookbody: 0,
                        lookfeet: 0,
                        lookhead: 0,
                        looklegs: 0,
                        lookmount: 0,
                        looktype: boostedBoss[0].id
                      }} kind="boss" />
                    </div>
                  </div> */}
                </div>

              </div>
              <div className='grid sm:grid-cols-12 sm:space-x-2 sm:space-y-0 space-y-2 grid-cols-1 mx-auto max-w-screen-xl'>

                <div className='sm:col-span-2 col-span-1 gap-2 space-y-2 '>
                  {/* <LoginBox />   */}
					{/* LOGIN */}
                
                      {/* <Button size={'lg'} variant={'blue'} asChild>
                        <Link href={'/download'} className='justify-start gap-2'>Download</Link>
                      </Button> */}
            
                    {/* <MainMenu /> */}
          

                </div>

                <div className='col-span-8 space-y-2 pb-8'>
                  <div className='flex flex-col p-1 gap-2 bg-background/10 shadow rounded-md backdrop-blur-[6px]'>
                    <div className='flex items-center justify-between bg-gray-50 rounded-sm p-1'>


                      <div className='flex flex-row gap-4'>
                        {/* <Link href={'/download'} className='flex flex-row items-center text-xs'>
                          <IconiFy icon={'line-md:download-loop'} /> Home
                        </Link>
						<Link href={process.env.DISCORD_URL ?? '#'} className='flex flex-row items-center text-xs'>
                          <IconiFy icon={'line-md:discord'} className='w-6' /> Account
                        </Link>
                        <Link href={process.env.DISCORD_URL ?? '#'} className='flex flex-row items-center text-xs'>
                          <IconiFy icon={'line-md:discord'} className='w-6' /> Community
                        </Link>
                        <Link href={process.env.YOUTUBE_URL ?? ' #'} className='flex flex-row items-center text-xs '>
                          <IconiFy icon={'line-md:youtube'} className='w-6' /> Library
                        </Link>
						<Link href={process.env.YOUTUBE_URL ?? ' #'} className='flex flex-row items-center text-xs '>
                          <IconiFy icon={'line-md:youtube'} className='w-6' /> Donate
                        </Link> */}
						<MainMenu />
             
    
                      </div>

                      <div className='flex items-center space-x-1 p-1 px-2'>
                        {statusServer.status
                          ? <Badge variant={'info'}>{countOnline} players</Badge>
                          : <Badge variant={'error'}>OFFLINE</Badge>
                        }
                      </div>

                    </div>
                  </div>

				  <div className='relative flex flex-col p-1 gap-2 bg-background/10 shadow rounded-md backdrop-blur-[6px] -z-10'>
					{children}
				  </div>

              

                </div>

                <div className='sm:col-span-2 col-span-1 gap-2 space-y-2 '>
                  <div className='bg-background/10 shadow rounded-sm backdrop-blur-[6px] p-1 w-full'>
                    <Card>
                      <CardHeader className='border-b'>
                        <CardTitle className='grid grid-cols-2 text-center'>
                          <div>Creature</div>
                          <div>Boss</div>
                        </CardTitle>
                      </CardHeader>
                      <CardContent className='flex flex-row justify-between'>

                        {boostedCreature && boostedCreature[0] && (
                        <Boosted boosted={{
                          boostname: boostedCreature[0].id,
                          lookaddons: 0,
                          lookbody: 0,
                          lookfeet: 0,
                          lookhead: 0,
                          looklegs: 0,
                          lookmount: 0,
                          looktype: boostedCreature[0].id
                        }} kind="creature" />
                        )}

                        {boostedBoss && boostedBoss[0] && (
                        <Boosted boosted={{
                          boostname: boostedBoss[0].id,
                          lookaddons: 0,
                          lookbody: 0,
                          lookfeet: 0,
                          lookhead: 0,
                          looklegs: 0,
                          lookmount: 0,
                          looktype: boostedBoss[0].id
                        }} kind="boss" />
                        )}
                        
                      </CardContent>
                    </Card>

                  </div>
                  <div className='flex flex-col p-1 gap-2 bg-background/10 shadow rounded-md backdrop-blur-[6px]'>
                    <CountDown hour={19} min={55} />
                  </div>
                  <div className='flex flex-col p-1 gap-2 bg-background/10 shadow rounded-md backdrop-blur-[6px]'>
                    <RashidBox />
                  </div>

                </div>
              </div>
            </ScrollArea>
          </Provider>
          <Toaster />
        </>
      </body>
    </html>
  )
}
