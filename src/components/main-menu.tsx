import Image from "next/image";
import {
  Accordion,
  AccordionContent,
  AccordionItem,
  AccordionTrigger,
} from "@/components/ui/accordion";
import { Button } from "./ui/button";
import Link from "next/link";

export default function MainMenu() {
  return (
    <>
      <Accordion type="single" collapsible className="space-y-1 p-0 flex">
        <AccordionItem value="item-1" className="border-none p-0 relative">
          <AccordionTrigger className="p-3 bg-gray-100 rounded-sm decoration-none">
            <div className="flex flex-row gap-2 items-center">
              {/* <Image src={'/icons/icon-news.gif'} width={24} height={24} alt="Premium" /> */}
              News
            </div>
          </AccordionTrigger>

        </AccordionItem>

        <AccordionItem value="item-2" className="border-none relative">
          <AccordionTrigger className="p-1 px-2 bg-gray-100 rounded-sm">
            <div className="flex flex-row gap-2 items-center">
              <Image
                src={"/icons/icon-community.gif"}
                width={24}
                height={24}
                alt="Premium"
              />
              Community
            </div>
          </AccordionTrigger>
          <AccordionContent className="absolute top-full left-0 w-full bg-white shadow-lg ">
            <div className="flex flex-col space-y-1 mt-1 p-2">
              <Button asChild className="justify-between bg-white text-black  hover:text-red-900 hover:bg-white shadow-none">
                <Link href={"/characters"}>Characters</Link>
              </Button>
              <Button asChild className="justify-between bg-white text-black  hover:text-red-900 hover:bg-white shadow-none">
                <Link href={"/online"}>Who&apos;s Online</Link>
              </Button>
              <Button asChild className="justify-between bg-white text-black  hover:text-red-900 hover:bg-white shadow-none">
                <Link href={"/highscores"}>Highscores</Link>
              </Button>
              <Button asChild className="justify-between bg-white text-black  hover:text-red-900 hover:bg-white shadow-none">
                <Link href={"/guilds"}>Guilds</Link>
              </Button>
              <Button asChild className="justify-between bg-white text-black  hover:text-red-900 hover:bg-white shadow-none">
                <Link href={"/last-kills"}>Last Kills</Link>
              </Button>
              <Button asChild className="justify-between bg-white text-black  hover:text-red-900 hover:bg-white shadow-none">
                <Link href={"/support-list"}>Support List</Link>
              </Button>
              <Button asChild className="justify-between bg-white text-black  hover:text-red-900 hover:bg-white shadow-none">
                <Link href={"/casts"}>Casts</Link>
              </Button>
            </div>
          </AccordionContent>
        </AccordionItem>

        <AccordionItem value="item-3" className="border-none relative">
          <AccordionTrigger className="p-1 px-2 bg-gray-100 rounded-sm">
            <div className="flex flex-row gap-2 items-center">
              <Image
                src={"/icons/icon-library.gif"}
                width={24}
                height={24}
                alt="Premium"
              />
              Library
            </div>
          </AccordionTrigger>
          <AccordionContent className="absolute top-full left-0 w-full bg-white shadow-lg ">
            <div className="flex flex-col space-y-1 mt-1 p-2">
              <Button asChild className="justify-between bg-white text-black  hover:text-red-900 hover:bg-white shadow-none">
                <Link href={"/server-info"}>Server Infos</Link>
              </Button>
              <Button asChild className="justify-between bg-white text-black  hover:text-red-900 hover:bg-white shadow-none">
                <Link href={"/loyalty"}>Loyalty</Link>
              </Button>
              <Button asChild className="justify-between bg-white text-black  hover:text-red-900 hover:bg-white shadow-none">
                <Link href={"/rules"}>Rules</Link>
              </Button>
            </div>
          </AccordionContent>
        </AccordionItem>

        <AccordionItem value="item-4" className="border-none relative">
          <AccordionTrigger className="p-1 px-2 bg-gray-100 rounded-sm">
            <div className="flex flex-row gap-2 items-center">
              <Image
                src={"/icons/icon-shops.gif"}
                width={24}
                height={24}
                alt="Premium"
              />
              Shop
            </div>
          </AccordionTrigger>
          <AccordionContent className="absolute top-full left-0 w-full bg-white shadow-lg ">
            <div className="flex flex-col space-y-1 mt-1 p-2">
              <Button asChild className="justify-between bg-white text-black  hover:text-red-900 hover:bg-white shadow-none">
                <Link href={"/shop"}>Buy Coins</Link>
              </Button>
              <Button asChild className="justify-between bg-white text-black  hover:text-red-900 hover:bg-white shadow-none">
                <Link href={"/character-market"}>Character Market</Link>
              </Button>
            </div>
          </AccordionContent>
        </AccordionItem>
      </Accordion>
    </>
  );
}
